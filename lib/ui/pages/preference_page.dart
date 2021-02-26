part of 'pages.dart';

class PreferencePage extends StatefulWidget {
  final List<String> genres = [
    "Horor",
    "Action",
    "Comedy",
    "Drama",
    "War",
    "Crime"
  ];
  final List<String> languages = ["Bahasa", "English", "Rusians", "Italian"];
  final RegistrationData registrationData;

  PreferencePage(this.registrationData);

  @override
  _PreferencePageState createState() => _PreferencePageState();
}

class _PreferencePageState extends State<PreferencePage> {
  List<String> selectedGenre = [];
  String selectedLanguage = "Bahasa";
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        widget.registrationData.password = "";

        context
            .read<PageBloc>()
            .add(GoToRegistrationPage(widget.registrationData));
        return;
      },
      child: Scaffold(
        body: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: ListView(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 56,
                    margin: EdgeInsets.only(top: 20, bottom: 4),
                    child: GestureDetector(
                        onTap: () {
                          widget.registrationData.password = "";
                          context.read<PageBloc>().add(
                              GoToRegistrationPage(widget.registrationData));
                        },
                        child: Icon(Icons.arrow_back)),
                  ),
                  Text("Select Your Four\nFavorite Genres",
                      style: blackTextFont.copyWith(fontSize: 20)),
                  SizedBox(height: 16),
                  Wrap(
                    spacing: 24,
                    runSpacing: 24,
                    children: generateGenreWidget(context),
                  ),
                  SizedBox(height: 24),
                  Text("Movie Language\nYou Prefer?",
                      style: blackTextFont.copyWith(fontSize: 20)),
                  SizedBox(height: 16),
                  Wrap(
                    spacing: 24,
                    runSpacing: 24,
                    children: generateLangWidget(context),
                  ),
                  SizedBox(height: 30),
                  Center(
                    child: FloatingActionButton(
                        elevation: 0,
                        backgroundColor: mainColor,
                        child: Icon(Icons.arrow_forward),
                        onPressed: () {
                          if (selectedGenre.length != 4) {
                            Flushbar(
                              duration: Duration(milliseconds: 1500),
                              flushbarPosition: FlushbarPosition.TOP,
                              backgroundColor: Colors.red,
                              message: "Please select 4 genres",
                            )..show(context);
                          } else {
                            widget.registrationData.selectedGenre =
                                selectedGenre;
                            widget.registrationData.selectedLang =
                                selectedLanguage;

                            context.read<PageBloc>().add(
                                GoToAccountConfirmationPage(
                                    widget.registrationData));
                          }
                        }),
                  ),
                  SizedBox(height: 50),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> generateGenreWidget(BuildContext context) {
    double width =
        (MediaQuery.of(context).size.width - 2 * defaultMargin - 24) / 2;

    return widget.genres
        .map((e) => SelecttableBox(
              e,
              widht: width,
              isSelected: selectedGenre.contains(e),
              onTap: () {
                onSelectGenre(e);
              },
            ))
        .toList();
  }

  List<Widget> generateLangWidget(BuildContext context) {
    double width =
        (MediaQuery.of(context).size.width - 2 * defaultMargin - 24) / 2;

    return widget.languages
        .map((e) => SelecttableBox(
              e,
              widht: width,
              isSelected: selectedLanguage == e,
              onTap: () {
                setState(() {
                  selectedLanguage = e;
                });
              },
            ))
        .toList();
  }

  void onSelectGenre(String genre) {
    if (selectedGenre.contains(genre)) {
      setState(() {
        selectedGenre.remove(genre);
      });
    } else {
      if (selectedGenre.length < 4) {
        setState(() {
          selectedGenre.add(genre);
        });
      }
    }
  }
}
