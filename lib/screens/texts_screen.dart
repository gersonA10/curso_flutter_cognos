import 'package:components_app/widgets/input_custom.dart';
import 'package:flutter/material.dart';

class TextScreen extends StatefulWidget {
  const TextScreen({super.key});

  @override
  State<TextScreen> createState() => _TextScreenState();
}

class _TextScreenState extends State<TextScreen> {
  //Variable para la validacion
  bool _onClick = false;
  //Creamos un getter que recibira nuestra variable
  bool get onClick1 => _onClick;
  //Crearmos un setter para luego en nuestro boton podamos cambiar el valor de nuestra variable
  set onClick(bool value) {
    _onClick = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    //las KEYS son utilizadas para mantener la referencia a un widget
    //ahora todo el formulario y su stado lo tenemos en nuestra variable
    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();

    //los datos de nuestro map los remplazaremos por los datos que escribamos
    final Map<String, String> formValues = {
      "email": "gerson@gmail.com",
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
                InputCustom(
                  hinText: "email",
                  icon: Icons.email,
                  textInputType: TextInputType.emailAddress,
                  formProperty: 'email',
                  formValues: formValues,
                  validator: (value) {
                    return value!.length < 3 ? "Minimo 3 Letras" : null;
                  },
                ),
                InputCustom(
                  hinText: "password",
                  icon: Icons.lock_outline_rounded,
                  obscureText: true,
                  formProperty: 'password',
                  formValues: formValues,
                  validator: (value) {
                    return value!.length < 6 ? "Minimo 6 Letras" : null;
                  },
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
                    formValues["role"] = value ?? "user";
                  },
                  validator: (value) {
                    // if (value == null) {
                    //   print("ESTA VACIO");
                    // }
                    return value == null ? "Esta vacio" : null;
                  },
                ),

                //BOTON GUARDAR
                ElevatedButton(
                  onPressed: onClick1
                      ? null
                      : () async {
                          //TODO: AGREGAR VALIDACION DEL BOTON
                          //DESACTIVAR EL TELCADO
                          //FocusScope.of(context).requestFocus(FocusNode());
                          // si no es valido hacemos un return

                          if (!myFormKey.currentState!.validate()) {
                            showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: ((context) {
                                return AlertDialog(
                                  //backgroundColor: AppTheme.primary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  elevation: 20.0,
                                  //title: Text("LLENA LOS CAMPOS"),
                                  //icon: FlutterLogo(),
                                  content:
                                      const Text("LLENA LOS CAMPOS REQUIRIDOS"),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text("Ok"),
                                    ),
                                  ],
                                );
                              }),
                            );
                            return;
                          }
                          // * imprimir valores del formulario
                          print(formValues);
                          //print(onClick);
                          //aca lo desactivamos
                          onClick = true;
                          await Future.delayed(const Duration(seconds: 2));
                          onClick = false;
                          Navigator.pop(context);
                        },
                  child: const SizedBox(
                    width: double.infinity,
                    child: Center(
                      child: Text("Guardar"),
                    ),
                  ),
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
