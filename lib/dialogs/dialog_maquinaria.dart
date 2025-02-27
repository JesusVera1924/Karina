import 'package:flutter/material.dart';
import 'package:tesis_karina/entity/maquinaria.dart';
import 'package:tesis_karina/provider/maquinaria_provider.dart';
import 'package:tesis_karina/style/custom/custom_input.dart';
import 'package:tesis_karina/utils/util_view.dart';

Future showDialogViewMaquinaria(BuildContext context, String title,
    MaquinariaProvider maquinariaProvider, Maquinaria? maquinaria) async {
  final txtNonbre =
      TextEditingController(text: maquinaria == null ? "" : maquinaria.nombre);
  final txtTipo =
      TextEditingController(text: maquinaria == null ? "" : maquinaria.tipo);

  await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          //  backgroundColor: Color(0xFF8793B2),
          title: Text(title),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          content: SizedBox(
            height: 110,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                TextFormField(
                  controller: txtNonbre,
                  decoration: CustomInputs.boxInputDecoration(
                      hint: 'Nombre',
                      label: 'Nombre',
                      icon: Icons.new_releases_outlined),
                  style: const TextStyle(color: Colors.black),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: txtTipo,
                  decoration: CustomInputs.boxInputDecoration(
                      hint: 'Tipo de maquinaria',
                      label: 'Tipo',
                      icon: Icons.new_releases_outlined),
                  style: const TextStyle(color: Colors.black),
                )
              ],
            ),
          ),
          actions: [
            TextButton(
                style: ButtonStyle(backgroundColor:
                    MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                  if (states.contains(MaterialState.hovered)) {
                    return Colors.black12;
                  }
                  return Colors.transparent;
                })),
                onPressed: () {
                  if (maquinaria == null) {
                    maquinariaProvider.newObjeto(Maquinaria(
                        uid: UtilView.numberRandonUid(),
                        nombre: txtNonbre.text,
                        tipo: txtTipo.text,
                        observacion: "",
                        estado: 1));
                  } else {
                    maquinaria.nombre = txtNonbre.text;
                    maquinaria.tipo = txtTipo.text;
                    maquinariaProvider.updateObjeto(maquinaria);
                  }

                  Navigator.of(context).pop();
                },
                child: const Text('Aceptar', style: TextStyle(fontSize: 14))),
            TextButton(
                style: ButtonStyle(backgroundColor:
                    MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                  if (states.contains(MaterialState.hovered)) {
                    return Colors.black12;
                  }
                  return Colors.transparent;
                })),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancelar', style: TextStyle(fontSize: 14))),
          ],
        );
      });
}

TextStyle buildStyle() {
  return const TextStyle(color: Colors.black, fontWeight: FontWeight.bold);
}
