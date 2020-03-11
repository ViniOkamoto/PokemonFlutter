import 'package:flutter/material.dart';

const String URL_BASE = "https://pokeapi.co/api/v2";

// ignore: missing_return
Color catchColor(String type){
  switch(type){
    case "speed":
      {
        return Colors.greenAccent;
      }
        break;
    case "special-attack":
      {
        return Colors.deepOrangeAccent[100];
      }
      break;
    case "special-defense":
      {
        return Colors.teal;
      }
      break;
    case "defense":
      {
        return Colors.indigoAccent;
      }
      break;
    case "attack":
      {
        return Colors.deepOrangeAccent;
      }
      break;
    case "hp":
      {
        return Colors.redAccent;
      }
      break;
    case "normal":
      {
        return Colors.grey;
      }
      break;
    case "fighting":
      {
        return Colors.red[700];
      }
      break;
    case "flying":
      {
        return Colors.deepPurpleAccent[100];
      }
      break;
    case "poison":
      {
        return Colors.deepPurple[400];
      }
      break;
    case "ground":
      {
        return Colors.orangeAccent[200];
      }
      break;
    case "rock":
      {
        return Colors.brown[400];
      }
      break;
    case "bug":
      {
        return Colors.lightGreen[500];
      }
      break;
    case "ghost":
      {
        return Colors.indigoAccent;
      }
      break;
    case "steel":
      {
        return Colors.grey[700];
      }
      break;
    case "fire":
      {
        return Colors.deepOrange;
      }
      break;
    case "water":
      {
        return Colors.blue[700];
      }
      break;
    case "grass":
      {
        return Colors.green[400];
      }
      break;
    case "electric":
      {
        return Colors.yellowAccent;
      }
      break;
    case "psychic":
      {
        return Colors.pinkAccent;
      }
      break;
    case "ice":
      {
        return Colors.lightBlueAccent[100];
      }
      break;
    case "dragon":
      {
        return Colors.deepPurple[600];
      }
      break;
    case "dark":
      {
        return Colors.brown[700];
      }
      break;
    case "fairy":
      {
        return Colors.pinkAccent[100];
      }
      break;
    case "unknown":
      {
        return Colors.grey;
      }
      break;
    case "shadow":
      {
        return Colors.black;
      }
      break;
  }

}