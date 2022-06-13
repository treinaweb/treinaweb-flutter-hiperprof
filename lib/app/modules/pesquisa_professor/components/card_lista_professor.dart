import 'package:flutter/material.dart';
import 'package:hiperprof/app/components/ht_text_title.dart';

class CardProfessor extends StatelessWidget {
  const CardProfessor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          GestureDetector(
            child: Visibility(
              visible: false,
              replacement: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Icon(
                  Icons.person,
                  size: 50,
                ),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: NetworkImage('https://github.com/treinaweb.png'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HPTextTitle(text: 'Treinaweb', size: HPSizeTitle.small),
              Row(
                children: [
                  Container(
                    color: Colors.grey[800],
                    margin: const EdgeInsets.only(right: 5),
                    child: const Icon(
                      Icons.attach_money,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  const Text(
                    'R\$ 50,00',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const Text(
                'dwa da dw ad wwd daw da dwkm akd awkm damd la, dwa daw dka mdlwam dkam dwam kdma owm oamdo dlá',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              )
            ],
          )
        ],
      ),
    );
  }
}
