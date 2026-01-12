part of 'pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime timeBackPressed = DateTime.now();

  int current = 0;

  List persons = [];
  List original = [];
  TextEditingController txtQuery = new TextEditingController();

  void loadData() async {
    String jsonStr = await rootBundle.loadString('assets/persons.json');
    var json = jsonDecode(jsonStr);
    persons = json;
    original = json;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: [
                WillPopScope(
                  child: Stack(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            width: double.infinity,
                            height:
                                190 + MediaQuery.of(context).viewPadding.top,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  'https://images.unsplash.com/photo-1462400362591-9ca55235346a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1432&q=80',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 100,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(
                                15.0 + MediaQuery.of(context).viewPadding.top,
                              ),
                              child: Center(
                                child: Text(
                                  'Welcome to Travessence',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                            Card(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'OVO Balance',
                                          style: GoogleFonts.poppins(
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Spacer(),
                                        Align(
                                          alignment: Alignment.topCenter,
                                          child: Text(
                                            'RP',
                                            style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "0",
                                          style: GoogleFonts.poppins(
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 12,
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            15,
                                          ),
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 5,
                                              vertical: 5,
                                            ),
                                            color: Colors.grey[300],
                                            child: Icon(
                                              Icons.arrow_forward_ios,
                                              size: 15,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(thickness: 1),
                                    //  STEPNOTES MENU
                                    const SizedBox(height: 10),
                                    // StepnotesMenu(),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  onWillPop: () async {
                    final difference = DateTime.now().difference(
                      timeBackPressed,
                    );
                    final isExitWarning =
                        difference >= const Duration(seconds: 2);
                    timeBackPressed = DateTime.now();
                    if (isExitWarning) {
                      Fluttertoast.showToast(
                        msg: "Please tap again to exit",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.TOP,
                        timeInSecForIosWeb: 1,
                        backgroundColor: travessence,
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                      return false;
                    } else {
                      Fluttertoast.cancel();
                      return true;
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
