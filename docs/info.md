<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

Esta maquina de estado finito esta formada por dos maquinas de estado finito, una de tipo Moore y otra de tipo Mealy. La maquina de tipo Moore se encarga de recibir el credito y le envia esta informacion a la maquina de tipo Mealy que es la encargada de identificar el credito y decodificar el producto que se desea entregar.

## How to test

Para probarlo en una placa de desarrollo Basys 3 se puede utilizar el sw0=m y sw1=a. Si se activa y desactiva el switch m una vez se habrá ingresado una moneda y al activa y desactivar el sw1=a este valor sera aceptado y se completará la entrega del producto.

## External hardware

. Basys 3 FPGA Board
- Built-in LED´s (los 3 iniciales para visualizar el producto y los 3 siguiente para visualizar el credito)
- Built-in switches (para ingresar las monedas y la señal de aceptado)
