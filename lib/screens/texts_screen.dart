import 'package:components_app/widgets/input_custom.dart';
import 'package:flutter/material.dart';

class TextScreen extends StatelessWidget {
  const TextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //las KEYS son utilizadas para mantener la referencia a un widget
    //ahora todo el formulario y su stado lo tenemos en nuestra variable
    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();

    //los datos de nuestro map los remplazaremos por los datos que escribamos
    final Map<String, String> formValues = {
      "email": "Gerson",
      "password": "12345",
      "role": "Admin",
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text("TextForm Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          //WIDGET FORM nos ayuda a validar todos nuestros formularios
          child: Form(
            //Agregamos nuetsra key
            //para utilizarla en nuestro boton
            key: myFormKey,
            child: Column(
              children: [
                /*
                EJERCICIO:

                Crear un formulario de registro
                Donde se piden los sihuientes datos:

                nombre,
                apellido,
                telefono,
                password,



                */
                InputCustom(
                  hinText: "email",
                  icon: Icons.email,
                  textInputType: TextInputType.emailAddress,
                  formProperty: 'email',
                  formValues: formValues,
                ),
                InputCustom(
                  hinText: "password",
                  icon: Icons.lock_outline_rounded,
                  obscureText: true,
                  formProperty: 'password',
                  formValues: formValues,
                ),

                DropdownButtonFormField<String>(
                  items: const [
                    DropdownMenuItem(
                      value: "Admin",
                      child: Text("Admin"),
                    ),
                    DropdownMenuItem(
                      value: "Super User",
                      child: Text("Super User"),
                    ),
                    DropdownMenuItem(
                      value: "Developer",
                      child: Text("Developer"),
                    ),
                    DropdownMenuItem(
                      value: "Jr Developer",
                      child: Text("Jr Developer"),
                    ),
                  ],
                  onChanged: (value) {
                    formValues["role"] = value ?? "Admin";
                  },
                ),

                //BOTON GUARDAR
                ElevatedButton(
                  child: const SizedBox(
                    width: double.infinity,
                    child: Center(
                      child: Text("Guardar"),
                    ),
                  ),
                  onPressed: () {
                    //DESACTIVAR EL TELCADO
                    FocusScope.of(context).requestFocus(FocusNode());
                    // si no es valido hacemos un return
                    if (!myFormKey.currentState!.validate()) {
                      print("FORMULARIO NO VALIDO");
                      return;
                    }
                    // * imprimir valores del formulario
                    print(formValues);
                  },
                )
                //EL TEXTFIELD ES CUANDO NO USAMOS FORMULARIO
              ],
            ),
          ),
        ),
      ),
    );
  }
}
