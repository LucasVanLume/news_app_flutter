import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_clean_architecture/src/app_theme.dart';
import 'package:flutter_clean_architecture/core/configs/language/app_settings_language.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/entities/news_favorited_entity.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/entities/news_saved_entity.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/stores/saves_store.dart';
import 'package:flutter_clean_architecture/src/features/saves/ui/widgets/saves_news_save_list_item.dart';


class SavesAddNewsForm extends StatefulWidget {
  const SavesAddNewsForm({super.key});

  @override
  State<SavesAddNewsForm> createState() => _SavesAddNewsFormState();
}

class _SavesAddNewsFormState extends State<SavesAddNewsForm> {
  final savesStore = Modular.get<SavesStore>();
  final appSettings = Modular.get<AppSettingsLanguage>();
  late Map<String, String> translations ;

  double _dialogHeigth = 0.0;
  final _formKey = GlobalKey<FormState>();

  late TextEditingController authorController;
  late TextEditingController titleController;
  late TextEditingController urlController;
  late TextEditingController urlToImageController;

  @override
  void initState() {
    super.initState();

    authorController = TextEditingController();
    titleController = TextEditingController();
    urlController = TextEditingController();
    urlToImageController = TextEditingController();

    titleController.addListener(() { setState(() {});});
    urlToImageController.addListener(() { setState(() {});});

    Future.delayed(const Duration(milliseconds: 50),(){
      setState(() {
        _dialogHeigth = 620 / 1.30;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();

    authorController.dispose();
    titleController.dispose();
    urlController.dispose();
    urlToImageController.dispose();
  }

  String? validatorNotEmpty(String? primaryKey) {
    if (primaryKey == null || primaryKey.isEmpty) {
      return translations['requiredFieldAddNewsSaves'] ?? 'Campo obrigatório';
    }
    return null;
  }

  String? validatorUrl(String? value) {
    if (value == null || value.isEmpty) {
      return translations['requiredFieldAddNewsSaves'] ?? 'Campo obrigatório';
    }
    String pattern = r'^(https?|ftp)://[^\s/$.?#].[^\s]+\.[^\s]+\b';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return translations['urlValidAddNewsSaves'] ?? 'Insira Url válida';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    translations = appSettings.readTexts(context);
    Size size = MediaQuery.of(context).size;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: _dialogHeigth,
      width: size.width,
      decoration: BoxDecoration(
        color: AppTheme.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 40,
                width: size.width,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: AppTheme.appColor,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
                ),
                child: const Text(
                  'Add News',
                  style: TextStyle(
                    color: AppTheme.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    TextFormField(
                      controller: authorController,
                      validator: validatorNotEmpty,
                      cursorColor: AppTheme.appColor,
                      decoration: InputDecoration(
                        labelText: translations['authorAddNewsSaves'] ?? 'Autor',
                        fillColor: AppTheme.inkWellButtom,
                        filled: true,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: titleController,
                      validator: validatorNotEmpty,
                      cursorColor: AppTheme.appColor,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        labelText: translations['titleAddNewsSaves'] ?? 'Título',
                        fillColor: AppTheme.inkWellButtom,
                        filled: true,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: urlController,
                      validator: validatorUrl,
                      cursorColor: AppTheme.appColor,
                      keyboardType: TextInputType.url,
                      decoration: InputDecoration(
                        labelText: translations['urlAddNewsSaves'] ?? 'Url',
                        fillColor: AppTheme.inkWellButtom,
                        filled: true,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: urlToImageController,
                      validator: validatorUrl,
                      cursorColor: AppTheme.appColor,
                      keyboardType: TextInputType.url,
                      decoration: InputDecoration(
                        labelText: translations['urlImageAddNewsSaves'] ?? 'Url da Imagem',
                        fillColor: AppTheme.inkWellButtom,
                        filled: true,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SavesNewsSaveListItem(
                      author: authorController.text,
                      title: titleController.text,
                      url: urlController.text,
                      urlToImage: urlToImageController.text,
                      onTapDelete: () {},
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              if (savesStore.isAtSaves == true) {
                                final newsSave = NewsSaved(
                                  author: authorController.text,
                                  title: titleController.text,
                                  url: urlController.text,
                                  urlToImage: urlToImageController.text
                                );
          
                                savesStore.saveNews(newsSave);
          
                                Modular.to.pop(context);
          
          
                              } else if (savesStore.isAtFavorites == true) {
                                final newsFavorite = NewsFavorited(
                                  author: authorController.text,
                                  title: titleController.text,
                                  url: urlController.text,
                                  urlToImage: urlToImageController.text
                                );
          
                                savesStore.favoriteNews(newsFavorite);
          
                                Modular.to.pop(context);
                              }
                            }
                          },
                          style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(AppTheme.appColor)
                          ), 
                          child: const Text(
                            'Add',
                            style: TextStyle(
                              color: AppTheme.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}