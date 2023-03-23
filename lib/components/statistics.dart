import 'package:flutter/material.dart';

Widget buildStatisticsSection() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
    color: Colors.grey[100],
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildStatisticCard(
          title: 'Total Vehicles',
          value: '50',
          icon: Icons.directions_car,
        ),
        _buildStatisticCard(
          title: 'Checked-In Vehicles',
          value: '23',
          icon: Icons.check_circle_outline,
        ),
        _buildStatisticCard(
          title: 'Available Vehicles',
          value: '27',
          icon: Icons.av_timer,
        ),
      ],
    ),
  );
}

Widget _buildStatisticCard({
  required String title,
  required String value,
  required IconData icon,
}) {
  return Card(
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Row(
        children: [
          Icon(icon),
          SizedBox(width: 16.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title),
              SizedBox(height: 8.0),
              Text(
                value,
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
