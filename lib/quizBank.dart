import 'question.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/material.dart';

class QuizBank {
  int _num = 0;
  List<Question> _list_ques = [
    Question(
        question: 'You can lead a cow down stairs but not up stairs.',
        answer: false),
    Question(
        question: 'Approximately one quarter of human bones are in the feet',
        answer: true),
    Question(question: 'A slug\'s blood is green', answer: true),
    Question(question: 'Algeria is the larged country in africa', answer: true),
    Question(question: 'fire makes water look bad', answer: false),
    Question(question: 'Salah is better that mahrez', answer: false),
    Question(question: 'Salah can play for madrid', answer: false),
    Question(question: 'Mess is really the GOAT', answer: false),
    Question(question: 'Mahrez is the best player in man city', answer: true),
    Question(
        question: 'Canada is the dream country of Nabil Gouri', answer: false),
    Question(question: 'Algeria is a tech lead country', answer: false),
    Question(
        question:
            'Immigration to 1st world countries is pretty simple for algerian people ',
        answer: false),
    Question(
        question: 'Some cats are actually allergic to humans', answer: true),
    Question(
        question: 'Buzz Aldrin\'s mother\'s maiden name was \"Moon\".',
        answer: true),
    Question(
        question: 'It is illegal to pee in the Ocean in Portugal.',
        answer: true),
    Question(
        question:
            'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        answer: true),
  ];
  void reset() {
    _num = 0;
  }

  bool isFinished() {
    if (_num == _list_ques.length - 1) {
      return true;
    }
    return false;
  }

  void nextQuest() {
    if (_num < _list_ques.length - 1) {
      _num++;
    }
  }

  String get_quest() {
    return _list_ques[_num].question;
  }

  bool get_answer() {
    return _list_ques[_num].answer;
  }
}
