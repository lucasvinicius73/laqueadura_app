import 'package:flutter/material.dart';
import 'package:laqueadura_app/ui/pregnant/pregnancy_calculator_page.dart';
import 'package:laqueadura_app/ui/widgets/youtube_player_widget.dart';

class PregnantPage extends StatefulWidget {
  const PregnantPage({super.key});

  @override
  State<PregnantPage> createState() => _PregnantPageState();
}

class _PregnantPageState extends State<PregnantPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gestante'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Botão para navegar para a calculadora
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PregnancyCalculatorPage(),
                    ),
                  );
                },
                icon: Icon(Icons.calculate, size: 28),
                label: Text(
                  'Calculadora Gestacional',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "QuickSand",
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffD8AEA2),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 3,
                ),
              ),
            ),
            SizedBox(height: 12),

            SizedBox(
              child:
                YouTubePlayerWidget(videoUrl: "https://youtu.be/BaHoX6aImT8")
            ),

            SizedBox(height: 12),
            Text(
              'Informações para Gestantes',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: "QuickSand",
              ),
            ),
            SizedBox(height: 20),
            _buildExpansionTile(
              title: 'Solicitação no pré-natal',
              content: [
                'Durante a gestação, você deve conversar com o seu médico ou enfermeiro durante a sua consulta de pré-natal e manifestar seu desejo de realizar a laqueadura. Esse pedido é registrado no prontuário e, a partir daí, a equipe multiprofissional inicia a orientação e organiza a documentação necessária.',
                '',
                'Esse passo é fundamental para garantir que a cirurgia seja feita no momento do parto.',
              ],
            ),
            _buildExpansionTile(
              title: 'Formas de realização da laqueadura no momento do parto',
              content: [
                'Você pode registrar a solicitação em qualquer fase da gestação, mas a cirurgia só acontece no parto.',
                '',
                'Se o seu parto for cesariana: a laqueadura será realizada logo após o nascimento do bebê, no mesmo ato cirúrgico.',
                '',
                'Se o seu parto for normal: a laqueadura pode ser feita até 48 horas depois, enquanto você ainda estiver internada, por meio de uma pequena cirurgia no abdome.',
                '',
                'Assim, você não perde o direito à laqueadura mesmo optando pelo parto normal.',
              ],
              important: [
                'Todas as autorizações e consentimentos devem ser obtidos com pelo menos 60 dias de antecedência da sua data provável do parto, conforme determina a lei.',
                'É proibido realizar uma cesariana apenas para fazer a laqueadura. O tipo de parto deve sempre seguir critérios médicos e de segurança para você e seu bebê.',
              ],
            ),
            _buildExpansionTile(
              title: 'Segurança para você e para o bebê',
              content: [
                'A laqueadura não afeta a saúde do seu bebê, não altera a produção do leite materno e não atrapalha a amamentação.',
                '',
                'Você poderá amamentar e cuidar do seu filho normalmente.',
                '',
                'O único impacto para você é o período de recuperação da cirurgia, que é semelhante ao de qualquer procedimento abdominal.',
              ],
            ),
            _buildExpansionTile(
              title: 'Cuidados necessários',
              content: [
                'Durante a gestação, você deve:',
              ],
              bullets: [
                'Manter suas consultas e exames de pré-natal em dia;',
                'Conversar abertamente com a equipe de saúde sobre riscos, benefícios e alternativas;',
                'Organizar a documentação e assinar o Termo de Consentimento Livre e Esclarecido.',
              ],
              content2: [
                '',
                'Após o parto, os cuidados envolvem:',
              ],
              bullets2: [
                'Seguir as orientações médicas de repouso e higiene;',
                'Observar a cicatrização da cirurgia;',
                'Comparecer às consultas de revisão pós-parto para garantir a sua boa recuperação.',
              ],
            ),
            _buildExpansionTile(
              title: 'Recuperação da laqueadura',
              content: [
                'Quando a laqueadura é feita na cesariana: A sua recuperação será semelhante à de uma cesariana. O tempo médio é de 4 a 6 semanas.',
                '',
                'Você precisará de repouso relativo, cuidado com os pontos e retorno às consultas de revisão.',
                '',
                'Quando a laqueadura é feita após o parto normal: É realizada uma pequena cirurgia no abdome, até 48 horas depois do parto. O tempo médio de recuperação é de 2 a 4 semanas.',
                '',
                'Você terá apenas cuidados simples com a cicatrização e repouso relativo.',
              ],
            ),
            _buildExpansionTile(
              title: 'Regras importantes',
              bullets: [
                'Você não pode fazer uma cesariana apenas para realizar a laqueadura. O tipo de parto deve sempre seguir critérios médicos e de segurança para você e seu bebê.',
                'A sua decisão pela laqueadura deve ser livre, consciente e registrada por escrito.',
                'Você pode desistir a qualquer momento antes da cirurgia, sem prejuízo ao seu atendimento.',
                'A laqueadura é um procedimento definitivo e irreversível.',
              ],
            ),
            _buildExpansionTile(
              title: 'E se você não conseguir fazer a laqueadura na gestação?',
              content: [
                'Se por algum motivo você não conseguir realizar a laqueadura durante a gestação ou no parto, ainda é possível fazer o procedimento em outro momento da sua vida.',
              ],
              bullets: [
                'Você pode agendar a cirurgia como um procedimento eletivo, fora do período gestacional.',
                'Esse procedimento pode ser realizado por videolaparoscopia (minimamente invasiva) ou por minilaparotomia (pequena incisão no abdome).',
                'O tempo de recuperação costuma ser menor, variando entre 1 e 3 semanas.',
              ],
              content2: [
                '',
                'Importante: a decisão continua sendo sua, deve ser registrada por escrito e acompanhada pela equipe multiprofissional.',
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildExpansionTile({
    required String title,
    List<String>? content,
    List<String>? bullets,
    List<String>? content2,
    List<String>? bullets2,
    List<String>? important,
  }) {
    return _PregnantExpandableCard(
      title: title,
      content: content,
      bullets: bullets,
      content2: content2,
      bullets2: bullets2,
      important: important,
    );
  }
}

class _PregnantExpandableCard extends StatefulWidget {
  const _PregnantExpandableCard({
    required this.title,
    this.content,
    this.bullets,
    this.content2,
    this.bullets2,
    this.important,
  });

  final String title;
  final List<String>? content;
  final List<String>? bullets;
  final List<String>? content2;
  final List<String>? bullets2;
  final List<String>? important;

  @override
  State<_PregnantExpandableCard> createState() =>
      _PregnantExpandableCardState();
}

class _PregnantExpandableCardState extends State<_PregnantExpandableCard>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  late AnimationController _controller;
  late Animation<double> _expandAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _expandAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header (sempre visível)
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: _toggleExpanded,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    // Ícone
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: const Color(0xffD8AEA2).withOpacity(0.15),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.article_outlined,
                        color: Color(0xffD8AEA2),
                        size: 22,
                      ),
                    ),
                    const SizedBox(width: 12),

                    // Título
                    Expanded(
                      child: Text(
                        widget.title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade800,
                        ),
                      ),
                    ),

                    // Seta de expansão
                    AnimatedRotation(
                      turns: _isExpanded ? 0.5 : 0,
                      duration: const Duration(milliseconds: 300),
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Conteúdo expandido
          SizeTransition(
            sizeFactor: _expandAnimation,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(color: Colors.grey.shade200),
                  const SizedBox(height: 12),

                  // Primeiro bloco de conteúdo
                  if (widget.content != null)
                    ...widget.content!.map((text) => text.isEmpty
                        ? const SizedBox(height: 8)
                        : Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              text,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey.shade700,
                                height: 1.5,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          )),

                  // Primeira lista de bullets
                  if (widget.bullets != null) ...[
                    if (widget.content != null && widget.content!.isNotEmpty)
                      const SizedBox(height: 8),
                    ...widget.bullets!.map((bullet) => Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 6),
                                width: 8,
                                height: 8,
                                decoration: const BoxDecoration(
                                  color: Color(0xffD8AEA2),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  bullet,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey.shade700,
                                    height: 1.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ],

                  // Segundo bloco de conteúdo
                  if (widget.content2 != null)
                    ...widget.content2!.map((text) => text.isEmpty
                        ? const SizedBox(height: 8)
                        : Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              text,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey.shade700,
                                height: 1.5,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          )),

                  // Segunda lista de bullets
                  if (widget.bullets2 != null) ...[
                    if (widget.content2 != null && widget.content2!.isNotEmpty)
                      const SizedBox(height: 8),
                    ...widget.bullets2!.map((bullet) => Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 6),
                                width: 8,
                                height: 8,
                                decoration: const BoxDecoration(
                                  color: Color(0xffD8AEA2),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  bullet,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey.shade700,
                                    height: 1.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ],

                  // Seção de avisos importantes
                  if (widget.important != null) ...[
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.amber.shade50,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.amber.shade300,
                          width: 1,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.warning_amber,
                                  color: Colors.amber.shade700, size: 22),
                              const SizedBox(width: 8),
                              Text(
                                'Importante:',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.amber.shade800,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          ...widget.important!.map((text) => Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(top: 6),
                                      width: 6,
                                      height: 6,
                                      decoration: BoxDecoration(
                                        color: Colors.amber.shade700,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Text(
                                        text,
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.grey.shade800,
                                          height: 1.5,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
