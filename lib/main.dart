import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'api_unsplash_services.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ApiUnsplashServices(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<ApiUnsplashServices>(context, listen: false).getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Unsplash Screen")),
      body: Consumer<ApiUnsplashServices>(
        builder: (context, apiService, child) {
var usedata=apiService.unsplashUserList;
          return ListView.builder(
            itemCount: usedata.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(usedata[index].user?.name ?? 'No Name'),
              );
            },
          );
        },
      ),
    );
  }
}
