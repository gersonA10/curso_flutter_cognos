import 'package:components_app/theme/theme_data.dart';
import 'package:flutter/material.dart';

class ListViewBuilderPage extends StatefulWidget {
  const ListViewBuilderPage({super.key});

  @override
  State<ListViewBuilderPage> createState() => _ListViewBuilderPageState();
}

class _ListViewBuilderPageState extends State<ListViewBuilderPage> {
  //controlara cuantos elemento se renderizan
  final List<int> list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  //Cual es la posiciion del scrooll de nuestro listview
  //PARA LISTVIEW TENEMOS QUE ESCUCHAR LOS CAMBIO QUE TAN ARRIBA O TAN ABAJO
  //controlaremos el listview y necestamos escuchar el scroll
  final ScrollController scrollController = ScrollController();

  bool isLoading = false;

  @override
  //cuando el state se crea por unica vez
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(() {
      //cuando algo suceda en el scroll aca se va a emitir
      //es la posicion actual
      if ((scrollController.position.pixels) >=
          //cual es lo maximo que pued llegar
          (scrollController.position.maxScrollExtent)) {
        //print(scrollController.position.pixels);
        fetchData();
        //print(add10);
      }
    });
  }

  //Hacer la simulacion de espera de los resultados
  Future fetchData() async {
    //no hacer nada si es true
    if (isLoading) return;
    //
    isLoading = true;
    setState(() {});

    //esperar y 3 segundos despues continuara
    await Future.delayed(const Duration(seconds: 3));
    add10();

    isLoading = false;
    setState(() {});

    //animar el scroll
    scrollController.animateTo(
      scrollController.position.pixels + 120,
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
    );
  }

  void add10() {
    //obtenemos el ultimo valor de nuestra lista
    final lastID = list.last;
    //para sumar basado en ese valor
    list.addAll(
      //en nuestro arreglo agarramos el ultimo valor y lo transformamos
      //aca estamos barriendo nuestra lista
      [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].map((e) => lastID + e),
    );
    setState(() {});
  }

  Future<void> onRefresh() async {
    await Future.delayed(const Duration(seconds: 2));
    final lastID = list.last;
    list.clear();
    list.add(lastID + 1);
    add10();
  }

  double _width = 400;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        //permite poner widgets encima de otro
        child: Stack(
          children: [
            RefreshIndicator(
              //cuando se resuelva un future se cargara el refrsh
              onRefresh: onRefresh,
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      controller: scrollController,
                      itemCount: list.length,
                      itemBuilder: ((context, index) {
                        final _position = list.indexOf(index).toDouble();
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            children: [
                              //https://picsum.photos
                              Card(
                                color: AppTheme.primary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Column(
                                    children: [
                                      FadeInImage(
                                        width: double.infinity,
                                        height: _width,
                                        placeholder:
                                            const AssetImage("assets/gif.gif"),
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                          //https://picsum.photos/id/237/200/300
                                          "https://picsum.photos/500/300?image=${list[index]}",
                                        ),
                                      ),
                                      SizedBox(
                                        height: 50,
                                        child: Center(
                                          child: Text(
                                            "Numero de Imagen: ${list[index].toString()}",
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
            if (isLoading)
              Positioned(
                bottom: 40,
                //el ancho que tenga el dispositivo, necesitamos la mitad y le restamos 30 pixeles
                left: size.width * 0.5 - 30,
                child: const _LoadingIcon(),
              ),
          ],
        ),

        /*
        EJERCICIO

        EN OTRA PANTALLA CREAR UNA  LIST VIEW BUILDER
        Y QUE NOS CARGUE EN 5 en 5 LAS IMAGENES

        LAS IMAGENES TIENEN QUE ESTAR EN UN CARD CON 
        BORDER COLOR Y EL ESTILO QUE QUIERAN COLOCAR

        DEBAJO DE CADA CARD NOS TIENE QUE MOSTRAR QUE NUMERO DE IMAGEN ES
        
        Y MANIPULAR YA SEA LA ALTURA O EL ANCHO DE TODAS LAS IMAGENES CON UN SLIDER

        *****OPCIONAL****
        Agregar la animacion de obtencion de Datos con el loading y el Pull to Refresh

        */
      ),
    );
  }
}

class _LoadingIcon extends StatelessWidget {
  const _LoadingIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        // borderRadius: BorderRadius.circular(400),
        shape: BoxShape.circle,
      ),
      height: 60,
      width: 60,
      child: const CircularProgressIndicator(
        color: AppTheme.primary,
      ),
    );
  }
}
