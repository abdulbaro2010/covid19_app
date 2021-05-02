import 'package:covid19_ui/models/network.dart';
import 'package:flutter/material.dart';

class StatsGrid extends StatefulWidget {
  @override
  _StatsGridState createState() => _StatsGridState();
}

class _StatsGridState extends State<StatsGrid> {
  APIResponseModel apiResponseModel;

  @override
  Widget build(BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.25,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
             Flexible(
                child: Row(
                  children: [
                    _buildStatCard("Today's Cases : ${apiResponseModel.todayCases}\n", Colors.orange),
                    _buildStatCard("Total Deaths : ${apiResponseModel.deaths}\n", Colors.orange),
              ],
            ),
              ),

                  Flexible(
                child: Row(
                  children: [
                    _buildStatCard("Today's Deaths : ${apiResponseModel.todayDeaths}\n", Colors.orange),
                    _buildStatCard("Total Recovered : ${apiResponseModel.recovered}\n", Colors.orange),
              ],
            ),
              ),

                  Flexible(
                child: Row(
                  children: [
                    _buildStatCard("Active Cases : ${apiResponseModel.active}\n", Colors.orange),
                    _buildStatCard("Critical Cases : ${apiResponseModel.critical}\n", Colors.orange),
              ],
            ),
              ),

                  Flexible(
                child: Row(
                  children: [
                    _buildStatCard("Cases per million: ${apiResponseModel.casesPerOneMillion}\n", Colors.orange),
                    _buildStatCard("Deaths per million: ${apiResponseModel.deathsPerOneMillion}\n", Colors.orange),
              ],
            ),
              ),

                  Flexible(
                child: Row(
                  children: [
                    _buildStatCard("Total Tests Done: ${apiResponseModel.tests}\n", Colors.orange),
                    _buildStatCard("Tests per million: ${apiResponseModel.testsPerOneMillion}\n", Colors.orange),
              ],
            ),
              ),

                  Flexible(
                child: Row(
                  children: [
                    _buildStatCard("Affected countires : ${apiResponseModel.affectedCountries}\n", Colors.orange),
                    
              ],
            ),
              ),

        ],
      ),
    );
  }

  Expanded _buildStatCard(String title, MaterialColor color){
    return Expanded(
                    child: Container(
                    margin: const EdgeInsets.all(8.0),
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(color: color,
                    borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(title,
                        style: const TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                        ),
                      ],
                    ),
                  ),
                );
  }
}