
import 'package:dr_ramy/models/search.dart';
import 'package:dr_ramy/modules/all_articles/specific_article/specific_article_screen.dart';
import 'package:dr_ramy/modules/all_team/doctor_details/doctor_details.dart';
import 'package:dr_ramy/services/searchApi.dart';
import 'package:dr_ramy/style/colors.dart';
import 'package:flutter/material.dart';

class SearchResult extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) => [
    IconButton(
      icon: Icon(Icons.clear),
      onPressed: () {
        if (query.isEmpty) {
          close(context, '');
        } else {
          query = '';
          showSuggestions(context);
        }
      },
    )
  ];

  @override
  Widget buildLeading(BuildContext context) => IconButton(
    icon: Icon(Icons.arrow_back),
    onPressed: () => close(context, ''),
  );

  @override
  Widget buildResults(BuildContext context) => FutureBuilder<Search>(
    future: SearchApi().getSearchResult(query),
    builder: (context, snapshot) {
      switch (snapshot.connectionState) {
        case ConnectionState.waiting:
          return Center(child: CircularProgressIndicator());
        default:
          if (snapshot.hasError) {
            return Container(
              color: Colors.black.withOpacity(0.1),
              alignment: Alignment.center,
              child: Text(
                'حدث خطء!',
                style: TextStyle(fontSize: 28, color: Colors.white),
              ),
            );
          } else {
            return Column(
              children:  List.generate(snapshot.data!.data.length, (index) {
                return buildResultSuccess(snapshot.data!.data[index]);

              }),
            );



          }
      }
    },
  );

  @override
  Widget buildSuggestions(BuildContext context) => Container(
   // color: kPrimaryColor.withOpacity(0.5),
    child: FutureBuilder<Search>(
      future: SearchApi().getSearchResult(query),
      builder: (context, snapshot) {
        if (query.isEmpty) return buildNoSuggestions();
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());
          default:
            if (snapshot.hasError || snapshot.data!.data.isEmpty) {
              return buildNoSuggestions();
            } else {
              return buildSuggestionsSuccess(snapshot.data!.data);
            }
        }
      },
    ),
  );

  Widget buildNoSuggestions() => Center(
    child: Text(
      'لا يوجد اقتراحات!',
      style: TextStyle(fontSize: 28, color: Colors.white),
    ),
  );

  Widget buildSuggestionsSuccess(List<Data> suggestions) =>
      ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
      final suggestion = suggestions[index];
      final queryText = suggestion.title.substring(0, query.length);
      final remainingText = suggestion.title.substring(query.length);
      return ListTile(
        onTap: () {
         // query = suggestion.title;
          // 1. Show Results
         showResults(context);
          // 2. Close Search & Return Result
        // close(context, suggestion.title);
          // 3. Navigate to Result Page
          suggestion.searchType=='blog'?
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => SpecificArticle(article_id: suggestion.id,)),
          ):
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => DoctorDetails(id: suggestion.id,)),
          );
        },
        leading:  getIcon(suggestion.searchType),

      //  suggestion.searchType=='blog'?Icon(Icons.article,color: Colors.grey,):Icon(Icons.person),
        // title: Text(suggestion),
        title: RichText(
          text: TextSpan(
            text: queryText,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            children: [
              TextSpan(
                text: remainingText,
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );

  Widget buildResultSuccess(Data search) => Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [Color(0xFF3279e2), Colors.purple],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    ),
    child: ListView(
      padding: EdgeInsets.all(64),
      children: [
        Text(
          search.title,
          style: TextStyle(
            fontSize: 32,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        // Icon(
        //   weather.icon,
        //   color: Colors.white,
        //   size: 140,
        // ),
        const SizedBox(height: 72),
        // Text(
        //   weather.description,
        //   style: TextStyle(
        //     fontSize: 20,
        //     color: Colors.white70,
        //   ),
        //   textAlign: TextAlign.center,
        // ),
        const SizedBox(height: 32),
      //  buildDegrees(weather),
      ],
    ),
  );

  Widget getIcon(String searchType) {
    if(searchType=='b'){
      return Icon(Icons.article,color: Colors.grey,);
    }
    else if(searchType=='doctor'){
      return Icon(Icons.person,color: Colors.grey,);
    }
    return Text('');
  }

  // Widget buildDegrees(Weather weather) {
  //   final style = TextStyle(
  //     fontSize: 100,
  //     fontWeight: FontWeight.bold,
  //     color: Colors.white,
  //   );
  //
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       Opacity(
  //         opacity: 0,
  //         child: Text('°', style: style),
  //       ),
  //       Text('${weather.degrees}°', style: style),
  //     ],
  //   );
  // }
}