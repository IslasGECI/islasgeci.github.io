---
layout: post
title: Imitadores y espías
author: Nepo
tags: programacion
---

En la presente nota mostraremos algunos ejemplos de los usos de la paquetería
[`pytest-mock`](https://github.com/pytest-dev/pytest-mock/). El código que aquí presentamos lo
podrás encontrar en `pollos_petrel/tests/tests_petrel_age_predictor.py`, en la consignación
[66eb24](https://bitbucket.org/IslasGECI/pollos_petrel/src/66eb24183f81df85350a715cc04ae120324a01df/tests/test_petrel_age_predictor.py).
En la sección de las referencias está la lista de material en la que nos inspiramos para escribir
esta nota.

## Imitador genérico

El objetivo es probar la función `get_subset_morphometric_data`. Esta función tiene dos variables de
entrada `Cleaner_Morphometric` y `Predictor`. Las dos variables son objetos de clases que aun no
implementamos, pero sabemos que nos gustaría que tuvieran las propiedades `data_subset` y
`predictions` respectivamente.

<pre><code>
def test_get_subset_morphometric_data(mocker):
    predictions = [1, 2, 3]
    expected_data_subset_dictionary = {
        "Fecha": ["01/Jan/2021", "02/Feb/2021", "03/Mar/2021"],
        "age_predictions": predictions,
        "Fecha_dt": [datetime(2021, 1, 1), datetime(2021, 2, 2), datetime(2021, 3, 3)],
    }
    expected_data_subset = pd.DataFrame(expected_data_subset_dictionary)
    data_subset = pd.DataFrame({"Fecha": ["01/Ene/2021", "02/Feb/2021", "03/Mar/2021"]})
    <span style="background-color:#ffc">Cleaner_Morphometric = mocker.Mock()</span>
    <span style="background-color:#ffc">Cleaner_Morphometric.data_subset = data_subset.copy()</span>
    <span style="background-color:#bfd9bf">Predictor = mocker.Mock()</span>
    <span style="background-color:#bfd9bf">Predictor.predictions = predictions</span>
    obtained_data_subset = get_subset_morphometric_data(Cleaner_Morphometric, Predictor)
    assert_frame_equal(obtained_data_subset, expected_data_subset)
</code></pre>

Lo que queremos es probar `get_subset_morphometric_data` y no desviarnos con la implementación de
las clases a la que pertenecen `Cleaner_Morphometric` y `Predictor`. Sandi Metz propone en [este
video](https://youtu.be/v-2yFMzxqwU) utilizar imitadores. Los imitadores son objetos que imitan el
comportamiento de objetos reales en formas controladas. Así, creamos imitadores para probar el
comportamiento de otro objeto, en la misma manera que los diseñadores de carros usan un maniquí de
prueba de choque para simular la dinámica de un humano en una colisión de autos. A continuación
veremos cómo los implementamos:
```python
    Cleaner_Morphometric = mocker.Mock()
    Cleaner_Morphometric.data_subset = data_subset.copy()
```
Definimos el objeto genérico `Cleaner_Morphometric` con propiedad `data_subset`. Hacemos algo
similar con objeto `Predictor` y su propiedad `predictions`:
```python
    Predictor = mocker.Mock()
    Predictor.predictions = predictions
```
[Stargirl](https://thea.codes/) sugiere que no usemos este tipo de imitadores. El motivo es que si
al implementar las clases cambiamos las interfaces la prueba no se enterará del cambio y por lo
tanto no fallará.

## Imitando objetos de clases particulares
En esta sección mostramos dos ejemplos en donde los imitadores heredan la interface de alguna clase,
para atender así la sugerencia de Stargirl. Con esta modificación si la interfaz cambia la prueba
nos recordará que debemos actualizarla. En el primer ejemplo generamos un imitador de la clase
`Predictions_and_Parameters`. Lo que nos interesa probar el funcionamiento de `Plotter` por lo que
no debemos de distraernos con obtener el objeto `Parameters`:

<pre><code>
def test_Plotter(mocker):
    <span style="background-color:#ffc">Parameters = mocker.Mock(spec=Predictions_and_Parameters)</span>
    <span style="background-color:#ffc">Parameters.data_for_plot.return_value = [1, 2, 3], [1, 2, 3]</span>
    Plotter_parameters = Plotter(Parameters)
    Plotter_parameters.plot()
    return Plotter_parameters.savefig("reports/figures/figura.png")
</code></pre>

En las líneas subrayadas definimos un imitador que tiene la misma interfaz que la clase
`Predictions_and_Parameters`. La clase `Predictions_and_Parameters` tiene un método llamado
`data_for_plot`. El imitador no tiene ninguna de las funcionalidades que tendría un objeto de la
clase `Predictions_and_Parameters`, pero tiene misma interfaz, es decir puedemos hacer un llamado al
método `data_for_plot`. A continuación solo presentamos las lineas en las que definimos `Parameters`
y le asignamos el valor que regresará el método `data_for_plot`:
```python
    Parameters = mocker.Mock(spec=Predictions_and_Parameters)
    Parameters.data_for_plot.return_value = [1, 2, 3], [1, 2, 3]
```
Este método es la manera en la que la clase `Plotter` se comunica con `Parameters`. Así que le
asignamos algún valor con el que sabemos que comportamiento esperamos de `Plotter`.

En la siguiente código presentamos un ejemplo más restrictivo. Lo que haremos ahora es "parchar" el
comportamiento de una clase, así el objeto parchado no tendrá el comportamiento original.

<pre><code>
def test_Fitter(mocker):
    <span style="background-color:#ffc">def train_test_split(self):</span>
    <span style="background-color:#ffc">    return (</span>
    <span style="background-color:#ffc">        np.array([6, 4, 8]).reshape(-1, 1),</span>
    <span style="background-color:#ffc">        np.array([1, 2, 3]).reshape(-1, 1),</span>
    <span style="background-color:#ffc">        [3, 2, 4],</span>
    <span style="background-color:#ffc">        pd.DataFrame({"y_train": [4]}),</span>
    <span style="background-color:#ffc">    )</span>
    <span style="background-color:#bfd9bf">mocker.patch(</span>
    <span style="background-color:#bfd9bf">    "pollos_petrel.petrel_age_predictor.Set_Morphometric.train_test_split", train_test_split</span>
    <span style="background-color:#bfd9bf">)</span>
    Morphometric_Data = Set_Morphometric(petrel_data)
    Fitter_model = Fitter(Morphometric_Data)
    assert Fitter_model.lineal_model.normalize
</code></pre>

Como podemos suponer de la sección verde, la clase `Set_Morphometric` tiene un método llamado
`train_test_split`. En el subrayado amarillo definimos la función con la que parchamos al método
`train_test_split`. El objeto `Morphometric_Data` es una instancia de la clase `Set_Morphometric`.
Pero lo que hicimos fue cambiar el comportamiento de la clase original. Sin importar cuál es el
valor de `petrel_data`, el método `train_test_split` siempre tendrá el mismo comportamiento. La
clave aquí es definir el parche antes de inicializar el objeto `Morphometric_Data`.

En los dos ejemplos anteriores, los objetos imitadores siguen una interfaz determinada. A
`Parameters` no lo construimos utilizando el constructor de su clase. `Morphometric_Data` es una
instancia de la clase `Set_Morphometric`, pero con el comportamiento modificado en el método
`train_test_split`.

## Espías
Habrá ocasiones en las que lo que nos interesa es saber si hicimos llamados a funciones de terceros
y no probar estas funciones. Si confiamos en que estas funciones están bien hechas y probadas por
sus desarrolladores, a nosotros lo que nos podría interesar es saber si estamos haciendo el llamado
de ellas en la manera correcta. Para esos casos usamos espías. En las primeras líneas del siguiente
bloque de código podemos notar que tenemos un imitador, tema que atendimos en los tres ejemplos
anteriores. Al final de la prueba definimos un espía para la función `makedirs` del módulo `os`:

<pre><code>
def test_Plotter_(mocker):
    delete_reports_figures()
    Parameters = mocker.Mock(spec=Predictions_and_Parameters)
    Parameters.data_for_plot.return_value = [1, 2, 3], [1, 2, 3]
    Plotter_parameters = Plotter(Parameters)
    Plotter_parameters.plot()
    <span style="background-color:#ffc">makedirs = mocker.spy(os, "makedirs")</span>
    <span style="background-color:#ffc">Plotter_parameters.savefig("reports/figures/figura.png")</span>
    <span style="background-color:#ffc">makedirs.assert_called_once_with("reports/figures")</span>
</code></pre>

El método `savefig` es de la clase `Plotter`. Y lo que nos interesa preguntarle al espía `makedirs`
es si fue llamado con el argumento `"reports/figures"`. El espía tiene su método para probar esa
información. Si no es llamado (solo una vez) o si es llamdo con otro valor de entrada la prueba
fallará.

## Conclusión
Vimos cuatro ejemplos de usos de la paquetería `pytest-mock`: tres ejemplos de imitadores y uno de
espías. Los ejemplos son de cómo los usamos imitadores en la Dirección de Ciencia de Datos de GECI.
Tratamos de seguir las recomendaciones de Stargirl en la manera de nombrarlon, pero presentamos un
ejemplo en donde no agregar una interfaz no era _tan_ mala idea. Parchamos el comportamiento de una
clase y finalmente utilizamos espías para asegurarnos de que llamábamos a una función desarrollada
por terceros de la manera esperada.

## Referencias
- [SOLID Object-Oriented Design](https://youtu.be/v-2yFMzxqwU)
- [My Python testing style guide](https://blog.thea.codes/my-python-testing-style-guide/)
- [pytest: How to mock in Python](https://changhsinlee.com/pytest-mock/)
- [Understanding the Python Mock Object Library](https://realpython.com/python-mock-library/)
- [pytest-mock](https://github.com/pytest-dev/pytest-mock/)
