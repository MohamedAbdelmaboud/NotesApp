import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_text.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({Key? key}) : super(key: key);
  static String id = 'DetailsView';
  @override
  Widget build(BuildContext context) {
    NoteModel noteModel =
        ModalRoute.of(context)!.settings.arguments as NoteModel;
    return Scaffold(
      appBar: AppBar(
        backgroundColor:primaryColor,
        centerTitle: true,
        title: const CustomText(
          'Details',
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 10,
                        backgroundColor:primaryColor,
                        shadowColor:primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        )),
                    onPressed: () {},
                    child: CustomText(
                      noteModel.title,
                      fontSize: 16,
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              CustomText(
                noteModel.content,
                color: Colors.white,
                fontWeight: FontWeight.w300,
                maxLines: MediaQuery.of(context).size.height.toInt(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
