import 'package:flutter/material.dart';
import 'package:learn/pages/activities/actitivitie_01/lession01/lession01Main.dart';
import './modelsClass.dart';


List<Activitie> activitiesList = [
  Activitie(
    id: 0,
    level: 1,
    title: "Passeando no Shopping",
    pageTitle: "Conteúdo das atividades",
    description: "Você está saindo com seus amigos para o Shopping com puco dinheiro.\nAprenda a curtir da melhor forma",
    backgroundColors: const [Color(0xFFDA59AE), Color(0xFF4912A2)],
    lessionsList: [
      Lession(
        id: 0, 
        title: "Montando o orçamento para o passeio", 
        description: "Antes de ir para o passeio, precisamos nos planejar com o dinheiro disponível que temos, esse é o primeiro passo para um passeio de qualidade!",
        page: Lession01Main()
      ),
      Lession(
        id: 0, 
        title: "Passeando no Shopping antes do cinema!", 
        description: "Estar no Shopping e não passear com os amigos antes do Cinema é o mesmo que não ter ido no Shopping né? Mas é preciso ter muito cuidado com os gastos!",
        page: Lession01Main()
      ),
      Lession(
        id: 0, 
        title: "Depois do passeio... Fazerndo as contas", 
        description: "Agora que o passeio passou, precisamos anotar tudo que gastamos para evitar prejuízos no futuro, vamos nessa?!",
        page: Lession01Main()
      ),
    ]
  ),
  Activitie(
    id: 1,
    level: 2,
    title: "Comprando novos jogos",
    pageTitle: "Conteúdo das atividades",
    description: "Você está saindo com seus amigos para o Shopping com puco dinheiro.\nAprenda a curtir da melhor forma",
    backgroundColors: const [Color(0xFF59D2DA), Color(0xFF1232A2)],
    lessionsList: [
      Lession(
        id: 0, 
        title: "Montando o orçamento para o passeio", 
        description: "Antes de ir para o passeio, precisamos nos planejar com o dinheiro disponível que temos, esse é o primeiro passo para um passeio de qualidade!",
        page: Lession01Main()
      ),
      Lession(
        id: 0, 
        title: "Passeando no Shopping antes do cinema!", 
        description: "Estar no Shopping e não passear com os amigos antes do Cinema é o mesmo que não ter ido no Shopping né? Mas é preciso ter muito cuidado com os gastos!",
        page: Lession01Main()
      ),
      Lession(
        id: 0, 
        title: "Depois do passeio... Fazerndo as contas", 
        description: "Agora que o passeio passou, precisamos anotar tudo que gastamos para evitar prejuízos no futuro, vamos nessa?!",
        page: Lession01Main()
      ),
    ]
  ),
  Activitie(
    id: 2,
    level: 2,
    title: "Comprando novos jogos",
    pageTitle: "Conteúdo das atividades",
    description: "Você está saindo com seus amigos para o Shopping com puco dinheiro.\nAprenda a curtir da melhor forma",
    backgroundColors: const [Color(0xFF59D2DA), Color(0xFF1232A2)],
    lessionsList: [
      Lession(
        id: 0, 
        title: "Montando o orçamento para o passeio", 
        description: "Antes de ir para o passeio, precisamos nos planejar com o dinheiro disponível que temos, esse é o primeiro passo para um passeio de qualidade!",
        page: Lession01Main()
      ),
      Lession(
        id: 0, 
        title: "Passeando no Shopping antes do cinema!", 
        description: "Estar no Shopping e não passear com os amigos antes do Cinema é o mesmo que não ter ido no Shopping né? Mas é preciso ter muito cuidado com os gastos!",
        page: Lession01Main()
      ),
      Lession(
        id: 0, 
        title: "Depois do passeio... Fazerndo as contas", 
        description: "Agora que o passeio passou, precisamos anotar tudo que gastamos para evitar prejuízos no futuro, vamos nessa?!",
        page: Lession01Main()
      ),
    ]
  ),
  Activitie(
    id: 3,
    level: 2,
    title: "Comprando novos jogos",
    pageTitle: "Conteúdo das atividades",
    description: "Você está saindo com seus amigos para o Shopping com puco dinheiro.\nAprenda a curtir da melhor forma",
    backgroundColors: const [Color(0xFF59D2DA), Color(0xFF1232A2)],
    lessionsList: [
      Lession(
        id: 0, 
        title: "Montando o orçamento para o passeio", 
        description: "Antes de ir para o passeio, precisamos nos planejar com o dinheiro disponível que temos, esse é o primeiro passo para um passeio de qualidade!",
        page: Lession01Main()
      ),
      Lession(
        id: 0, 
        title: "Passeando no Shopping antes do cinema!", 
        description: "Estar no Shopping e não passear com os amigos antes do Cinema é o mesmo que não ter ido no Shopping né? Mas é preciso ter muito cuidado com os gastos!",
        page: Lession01Main()
      ),
      Lession(
        id: 0, 
        title: "Depois do passeio... Fazerndo as contas", 
        description: "Agora que o passeio passou, precisamos anotar tudo que gastamos para evitar prejuízos no futuro, vamos nessa?!",
        page: Lession01Main()
      ),
    ]
  )
];

double getProgress(int activitieId, List<int> progress){
  if (activitieId > activitiesList.length){return 0;}
  return 100 * progress.length/(activitiesList[activitieId].lessionsList.length);
}