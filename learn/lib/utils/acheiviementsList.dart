import "package:flutter/material.dart";

class AchivievementData{
  final String nome;
  final String data;
  final List<Color> colors;

  AchivievementData({
    this.nome= "",
    this.data= "",
    this.colors= const [ Color(0xFFFFFFFF)]
  });

}

List<AchivievementData> achievementsList = [
  AchivievementData(nome: "Expert das finanças", data: "12/01/24", colors: const [Color(0xFF82DA59), Color(0xFF1290A2)]),
  AchivievementData(nome: "Bit... o que? Bitcoin!", data: "08/01/24", colors: const [Color(0xFFDA59AE), Color(0xFF2F12A2)])
];