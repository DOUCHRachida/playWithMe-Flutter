import '../models/QuestionModeltwo.dart';

List<QuestionModeltwo> getQuestions(){

  List<QuestionModeltwo> questions = <QuestionModeltwo>[];
  QuestionModeltwo questionModel = new QuestionModeltwo();

  //1
  questionModel.setQuestion("Sayyida al Hurra a gouverné Tetouan pendant 27 ans, de 1518 à 1542");
  questionModel.setAnswer("True");
  questionModel.setImageUrl("https://www.reseau-euromed.org/wp-content/uploads/2016/10/t%C3%A9touan1.jpg");
  questions.add(questionModel);
  questionModel = new QuestionModeltwo();

  //2
  questionModel.setQuestion("L'Université d'Al-Karaouine est située à Marrakech");
  questionModel.setAnswer("False");
  questionModel.setImageUrl("https://www.moroccojewishtimes.com/wp-content/uploads/2019/11/1CDD8944-CBEA-4D68-BD6A-328C4D719651-17208-00001893CEB4BF68-678x381.jpg");
  questions.add(questionModel);

  questionModel = new QuestionModeltwo();

  //3
  questionModel.setQuestion("La capitale du Maroc est Rabat ?");
  questionModel.setAnswer("True");
  questionModel.setImageUrl("https://www.frs.es/fileadmin/_processed_/3/7/csm_csm-frs-iberia-destinos-rabat_06cdf5682b.jpg");
  questions.add(questionModel);

  questionModel = new QuestionModeltwo();

  //4
  questionModel.setQuestion("L'arganier pousse naturellement dans la ville d'Agadir");
  questionModel.setAnswer("True");
  questionModel.setImageUrl("https://www.lopinion.ma/photo/art/grande/54481370-41007674.jpg?v=1615117592");
  questions.add(questionModel);

  questionModel = new QuestionModeltwo();

  //5
  questionModel.setQuestion("Le Maroc a accédé à l'indépendance en 1970");
  questionModel.setAnswer("False");
  questionModel.setImageUrl("https://atlasinfo.fr/wp-content/uploads/2020/01/Mohamed-Ben-Youssef-e1547135116789-700x430.jpg");
  questions.add(questionModel);

  questionModel = new QuestionModeltwo();

  //6
  questionModel.setQuestion("La plus ancienne université du monde est l'Université d'Al-Qarawiyyin au Maroc.");
  questionModel.setAnswer("True");
  questionModel.setImageUrl("http://visitefes.com/wp-content/uploads/2020/05/ancienne-universite.jpg");
  questions.add(questionModel);

  questionModel = new QuestionModeltwo();

  //7
  questionModel.setQuestion("La plus grande mosquée d'Afrique du Nord est située à Casablanca");
  questionModel.setAnswer("True");
  questionModel.setImageUrl("https://www.visitmorocco.com/sites/default/files/styles/thumbnail_events_slider/public/thumbnails/image/city-panorama.-casablanca-morocco.-africa-marianna-ianovska.jpg?itok=h4FjZSIp");
  questions.add(questionModel);

  questionModel = new QuestionModeltwo();

  //8
  questionModel.setQuestion("Le dinar est la monnaie dominante au Maroc");
  questionModel.setAnswer("False");
  questionModel.setImageUrl("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPLF2vynsoXQgRc00uThs41pSAj_njlALg9w&usqp=CAU");
  questions.add(questionModel);

  questionModel = new QuestionModeltwo();


  return questions;

}