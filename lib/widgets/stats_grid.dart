import 'package:covid19_ui/models/network.dart';
import 'package:flutter/material.dart';

class StatsGrid extends StatelessWidget {
  final APIResponseModel _apiResponseModel;

  StatsGrid(this._apiResponseModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            child: Row(
              children: [
                _buildStatCard(
                    "Today's Cases : ${_apiResponseModel?.todayCases ?? 0} \n",
                    Colors.orange),
                _buildStatCard(
                    "Total Deaths : ${_apiResponseModel?.deaths ?? 0} \n",
                    Colors.red),
              ],
            ),
          ),
          Flexible(
            child: Row(
              children: [
                _buildStatCard(
                    "Today's Deaths : ${_apiResponseModel?.todayDeaths ?? 0}\n",
                    Colors.red),
                _buildStatCard(
                    "Total Recovered : ${_apiResponseModel?.recovered ?? 0}\n",
                    Colors.pink),
              ],
            ),
          ),
          Flexible(
            child: Row(
              children: [
                _buildStatCard(
                    "Active Cases : ${_apiResponseModel?.active ?? 0}\n",
                    Colors.green),
                _buildStatCard(
                    "Critical Cases : ${_apiResponseModel?.critical ?? 0}\n",
                    Colors.purple),
              ],
            ),
          ),
          Flexible(
            child: Row(
              children: [
                _buildStatCard(
                    "Cases per million: ${_apiResponseModel?.casesPerOneMillion ?? 0}\n",
                    Colors.brown),
                _buildStatCard(
                    "Deaths per million: ${_apiResponseModel?.deathsPerOneMillion ?? 0}\n",
                    Colors.indigo),
              ],
            ),
          ),
          Flexible(
            child: Row(
              children: [
                _buildStatCard(
                    "Total Tests Done: ${_apiResponseModel?.tests ?? 0}\n",
                    Colors.teal),
                _buildStatCard(
                    "Tests per million: ${_apiResponseModel?.testsPerOneMillion ?? 0}\n",
                    Colors.cyan),
              ],
            ),
          ),
          Flexible(
            child: Row(
              children: [
                _buildStatCard(
                    "Affected countires : ${_apiResponseModel?.affectedCountries ?? 0}\n",
                    Colors.grey),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Expanded _buildStatCard(String title, MaterialColor color) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 19.0,
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
