import 'package:flutter/material.dart';
import 'package:laqueadura_app/ui/questions/widgets/questions_animated_container.dart';
import 'package:laqueadura_app/ui/questions/widgets/questions_label_text.dart';
import 'package:laqueadura_app/ui/widgets/send_button.dart';

class QuestionsPage extends StatelessWidget {
  const QuestionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Perguntas Frequentes"),
      ),
      backgroundColor: Color(0xFFFFFFFF),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 29,
            children: [
              QuestionsAnimatedContainer(
                title:
                    "Preciso da autorização do meu marido para fazer laqueadura?",
                content:
                    "Não. Desde 2022, a autorização do cônjuge não é mais exigida por lei. A decisão é individual.",
              ),
              QuestionsAnimatedContainer(
                title: "A laqueadura pode ser feita no momento do parto?",
                content:
                    "Sim, desde que a mulher tenha registrado sua vontade com 60 dias de antecedência e haja condições médicas adequadas.",
              ),
              QuestionsAnimatedContainer(
                title: "Só consigo laquear de fizer meu parto cesariano",
                content:
                    "Não. A laqueadura também pode ser feita após parto normal, desde que:\n\n"
                    "• A mulher tenha registrado sua vontade com pelo menos 60 dias de antecedência (durante o pré-natal, por exemplo);\n"
                    "• Haja condições médicas adequadas para realizar o procedimento;\n"
                    "• Todos os critérios legais tenham sido cumpridos (idade ou número de filhos, consentimento e acompanhamento).\n\n"
                    "A escolha da via de parto (normal ou cesárea) deve ser baseada em critérios clínicos — e não no desejo de fazer laqueadura. Fazer uma cesariana somente para realizar laqueadura é proibido pela legislação e pelas diretrizes do Ministério da Saúde.",
              ),
              QuestionsAnimatedContainer(
                title: "Tenho 18 anos e dois filhos. Posso fazer laqueadura?",
                content:
                    "Sim, se tiver capacidade civil plena. É necessário cumprir o prazo legal e passar por aconselhamento.",
              ),
              QuestionsAnimatedContainer(
                title: "Posso reverter a laqueadura?",
                content:
                    "A reversão existe, mas é difícil, cara e com baixa taxa de sucesso. Por isso, é considerada um método definitivo.",
              ),
              QuestionsAnimatedContainer(
                title: "O SUS é obrigado a fornecer os métodos contraceptivos?",
                content:
                    "Sim. O SUS deve oferecer os métodos de forma gratuita e em até 30 dias após a solicitação.",
              ),
              QuestionsAnimatedContainer(
                title: "Posso engravidar mesmo sendo laqueada?",
                content: "Sim, mas é muito raro.\n\n"
                    "A laqueadura é considerada um método altamente eficaz, com taxa de eficácia acima de 99%, mas nenhum método contraceptivo é 100% garantido.\n\n"
                    "A chance de gravidez após a laqueadura é baixa, mas pode ocorrer em casos raros, como:\n"
                    "• Recanalização espontânea das tubas (elas voltam a se ligar) sozinhas\n"
                    "• Técnica cirúrgica inadequada\n"
                    "• Falha nos materiais usados na cirurgia\n\n"
                    "Quando ocorre gravidez após laqueadura, ela pode até ser ectópica (fora do útero), o que representa risco à saúde da mulher.\n"
                    "Por isso, a decisão pela laqueadura deve ser bem pensada, com apoio de equipe de saúde e após o devido aconselhamento.",
              ),
              QuestionsAnimatedContainer(
                title: "Quais documentos são exigidos?",
                content:
                    "Irá depender de serviço para serviço, mas para iniciar o processo, normalmente, a unidade básica de saúde irá solicitar:\n"
                    "• Documento de identidade\n"
                    "• CPF\n"
                    "• Cartão do SUS\n\n"
                    "Depois no prosseguimento, a equipe multiprofissional pode pedir outros, tais como certidão de nascimento dos filhos.",
              ),
              QuestionsAnimatedContainer(
                title: "Posso solicitar laqueadura durante o pré-natal?",
                content:
                    "Sim. A manifestação pode ser feita durante o pré-natal e garante o direito à laqueadura no parto.",
              ),
              QuestionsAnimatedContainer(
                title:
                    "Quando posso fazer laqueadura mesmo sem ter 21 anos ou dois filhos?",
                content:
                    "Somente em casos de risco à saúde, com laudo assinado por dois médicos.",
              ),
              QuestionsAnimatedContainer(
                title: "Onde posso fazer o procedimento?",
                content:
                    "A laqueadura deve ser feita em hospital, com equipe especializada, preferencialmente pelo SUS.",
              ),
              QuestionsAnimatedContainer(
                title: "O procedimento pode ser feito fora do SUS?",
                content:
                    "Sim. É possível fazer laqueadura em hospitais e clínicas particulares por planos de saúde ou convênios.\n\n"
                    "O valor da laqueadura tubária em hospitais ou clínicas particulares pode variar bastante, dependendo de fatores como:\n"
                    "• A cidade e o hospital escolhido\n"
                    "• Tipo de cirurgia (videolaparoscopia ou cirurgia convencional)\n"
                    "• Inclusão de internação, anestesia e honorários médicos\n\n"
                    "Média de preços em 2025: É de R\$ 4.000 a R\$ 12.000\n\n"
                    "Esse valor pode incluir: consulta pré-operatória, exames, equipe médica, anestesia e internação.\n"
                    "Em planos de saúde, a cobertura depende do contrato e pode haver exigências de carência ou critérios clínicos.\n\n"
                    "Importante lembrar: o procedimento é gratuito pelo SUS, desde que cumpridos os requisitos legais (idade, filhos, prazo e consentimento).",
              ),
              QuestionsAnimatedContainer(
                title: "A equipe de saúde pode negar meu pedido?",
                content:
                    "Não, se os requisitos legais e clínicos forem cumpridos. A equipe deve orientar, mas não pode impedir a decisão.",
              ),
              QuestionsAnimatedContainer(
                title: "O hospital pode negar a laqueadura durante a cesárea?",
                content:
                    "Não, desde que o pedido tenha sido feito 60 dias antes e existam condições médicas.",
              ),
              QuestionsAnimatedContainer(
                title: "Posso mudar de ideia e escolher outro método?",
                content:
                    "Sim. Você tem o direito de escolher qualquer método contraceptivo, inclusive os reversíveis e de uso prolongado, como o DIU ou Implanom.",
              ),
              QuestionsAnimatedContainer(
                title:
                    "Tenho menos de 21 anos e nenhum filho. Posso fazer laqueadura?",
                content:
                    "Não, exceto em caso de risco à saúde comprovado com laudo médico.",
              ),
              QuestionsAnimatedContainer(
                title: "Preciso repetir o pedido mais de uma vez?",
                content:
                    "Não. Um único pedido, com 60 dias de antecedência e registrado por escrito, é suficiente.",
              ),
              QuestionsAnimatedContainer(
                title: "A decisão sobre o método contraceptivo é minha?",
                content:
                    "Sim. A escolha é pessoal e deve ser respeitada pela equipe de saúde.",
              ),
              QuestionsAnimatedContainer(
                title: "A equipe é obrigada a explicar riscos e alternativas?",
                content:
                    "Sim. O aconselhamento é obrigatório e deve apresentar todas as opções disponíveis.",
              ),
              QuestionsAnimatedContainer(
                title: "A laqueadura pode ser feita por histerectomia?",
                content:
                    "Não. A histerectomia não pode ser usada como método de esterilização.",
              ),
              QuestionsAnimatedContainer(
                title:
                    "Em caso de urgência médica, posso fazer sem aguardar os 60 dias?",
                content:
                    "Sim. Se houver risco à saúde da mulher ou do bebê, com laudo de dois médicos.",
              ),
              QuestionsAnimatedContainer(
                title:
                    "O que fazer se o hospital negar o procedimento indevidamente?",
                content:
                    "Você pode registrar denúncia na ouvidoria do SUS, Ministério Público ou Defensoria Pública.",
              ),
              QuestionsAnimatedContainer(
                title: "A vasectomia segue as mesmas regras da laqueadura?",
                content:
                    "Sim. Idade mínima de 21 anos ou dois filhos vivos, prazo de 60 dias e consentimento informado.",
              ),
              QuestionsAnimatedContainer(
                title: "Posso ser forçada a fazer laqueadura?",
                content:
                    "Não. Nenhum profissional ou instituição pode induzir, coagir ou exigir a esterilização.",
              ),
              QuestionsAnimatedContainer(
                title: "Laqueadura impede totalmente a gravidez?",
                content:
                    "É um método altamente eficaz, mas como qualquer método, tem chance mínima de falha.",
              ),
              QuestionsAnimatedContainer(
                title: "O procedimento dói?",
                content:
                    "É uma cirurgia simples e segura, feita com anestesia. A recuperação varia entre poucos dias a uma semana.",
              ),
              QuestionsAnimatedContainer(
                title: "Existe tempo mínimo de internação?",
                content:
                    "Geralmente, a internação é breve. Em muitos casos, a paciente recebe alta no mesmo dia ou no dia seguinte.",
              ),
              QuestionsAnimatedContainer(
                title: "Posso escolher o tipo de anestesia?",
                content:
                    "A escolha da anestesia depende da avaliação médica, do hospital e das condições de saúde da mulher.",
              ),
              QuestionsAnimatedContainer(
                title: "Quem deve fazer o aconselhamento?",
                content:
                    "A equipe multiprofissional do SUS, composta por médicos, enfermeiros e outros profissionais capacitados.",
              ),
              QuestionsAnimatedContainer(
                title:
                    "Posso fazer laqueadura sem ter passado por outros métodos antes?",
                content:
                    "Sim. A lei não exige que a mulher tenha tentado outros métodos antes de optar pela laqueadura.",
              ),
              QuestionsAnimatedContainer(
                title: "O SUS cobre o implante do DIU ou implante hormonal?",
                content:
                    "Sim. Esses métodos estão disponíveis na lista de contraceptivos fornecidos pelo SUS.",
              ),
              QuestionsAnimatedContainer(
                title:
                    "Onde posso buscar mais informações sobre meus direitos?",
                content:
                    "Nas unidades básicas de saúde, com os profissionais do SUS, ou nas cartilhas do Ministério da Saúde.",
              ),
              Text(
                "Faça uma pergunta:",
                style: TextStyle(fontSize: 20),
              ),
              QuestionsLabelText(label: "Nome"),
              QuestionsLabelText(label: "Email"),
              QuestionsLabelText(label: "Pergunta"),
              SendButton(
                title: "Enviar",
                onPress: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
