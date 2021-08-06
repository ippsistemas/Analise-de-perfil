unit Uteste;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, jpeg, ExtCtrls, sSkinProvider, sSkinManager,
  sLabel, sGauge, sSpeedButton;

type
  TForm1 = class(TForm)
    Label21: TLabel;
    sSkinManager1: TsSkinManager;
    sSkinProvider1: TsSkinProvider;
    sLabel1: TsLabel;
    sLabel2: TsLabel;
    sLabel3: TsLabel;
    lblNumero: TsLabel;
    lblQuestao: TsLabel;
    btIniciar: TsSpeedButton;
    sLabel4: TsLabel;
    sSpeedButtonSair: TsSpeedButton;
    btMuitoSempre: TsSpeedButton;
    btasVezesAlguma: TsSpeedButton;
    btPoucoRaramente: TsSpeedButton;
    btNuncaNao: TsSpeedButton;
    ValorA: TsLabel;
    valorB: TsLabel;
    valorC: TsLabel;
    valorD: TsLabel;
    valorE: TsLabel;
    valorF: TsLabel;
    valorG: TsLabel;
    valorH: TsLabel;
    valorI: TsLabel;
    valorJ: TsLabel;
    valorL: TsLabel;
    valorM: TsLabel;
    valorN: TsLabel;
    valorO: TsLabel;
    valorP: TsLabel;
    valorQ: TsLabel;
    valorR: TsLabel;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure btIniciarClick(Sender: TObject);
    procedure btMuitoSempreClick(Sender: TObject);
    procedure btasVezesAlgumaClick(Sender: TObject);
    procedure btPoucoRaramenteClick(Sender: TObject);
    procedure btNuncaNaoClick(Sender: TObject);
    procedure sSpeedButtonSairClick(Sender: TObject);
  private
    { Private declarations }
    procedure escolha(numero:integer);
    procedure mostraDons;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  P: array[1..170] of string;
  resultado: array[1..17] of Integer;
  ordem: integer;
  col: Integer;

implementation
{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
    //LENDO AS PERGUNTAS
    P[1]  := '1 - Gosto de organizar pessoas, tarefas e eventos.';
    P[2]  := '2 - Gostaria de iniciar igrejas em lugares que ainda n�o existam.';
    P[3]  := '3 - Sou criativo com madeira, tecido, tinta, metal, vidro ou outros materiais.';
    P[4]  := '4 - Atrav�s da arte c�nica eu posso ajudar as pessoas a entenderem melhor a si mesmas e seus relacionamentos.';
    P[5]  := '5 - Gosto de encorajar e fortalecer �queles que est�o abatidos.';
    P[6]  := '6 - Comunico o evangelho com clareza e efici�ncia.';
    P[7]  := '7 - Acho natural e f�cil confiar em Deus para responder �s minhas ora��es.';
    P[8]  := '8 - Contribuo com alegria para pessoas com necessidades financeiras.';
    P[9]  := '9 - Gosto de trabalhar apoiando o trabalho dos outros.';
    P[10] := '10 - Recebo em minha casa quem precisa de hospedagem ou de apoio.';
    P[11] := '11 - Eu recebo pedidos de ora��o de outras pessoas e oro por elas regularmente.';
    P[12] := '12 - consigo incentivar as pessoas a atingirem um alvo.';
    P[13] := '13 - Eu me identifico com as pessoas que est�o sofrendo, e desejo ajud�-las no processo de restaura��o.';
    P[14] := '14 - Falo de forma a criar convic��o e mudan�a nas vidas dos outros.';
    P[15] := '15 - Gasto tempo nutrindo e cuidando do espiritual das pessoas.';
    P[16] := '16 - Preparo estudos interessantes sobre a Palavra de Deus.';
    P[17] := '17 - As pessoas me pedem conselhos sobre assuntos espirituais ou pessoais.';
    P[18] := '18 - Sou cuidadoso em administrar detalhes.';
    P[19] := '19 - Acho interessante a id�ia de servir a Deus em lugar ou em outra comunidade, implantando um trabalho.';
    P[20] := '20 - Tenho habilidade em trabalhar com v�rios tipos de ferramentas manuais.';
    P[21] := '21 - Imagino maneiras interessantes de comunicar a Palavra de Deus.';
    P[22] := '22 - Estimulo a esperan�a nos oturos, direcionando-os �s promessas de Deus.';
    P[23] := '23 - Uso exemplos e textos b�blicos para ressaltar as necessidades espirituais das pessoas.';
    P[24] := '24 - Tenho confian�a na provis�o e ajuda cont�nua de DEUS, quando em tempos dif�cies.';
    P[25] := '25 - Contribuo com alegria para projetos que requerem verbas.';
    P[26] := '26 - Gosto de fazer coisas rotineiras que ap�iem o minist�rio.';
    P[27] := '27 - Gosto de conhecer pessoas novas e de ajud�-las a se sentirem bem-vindas na igreja.';
    P[28] := '28 - Gosto de passar longos per�odos em ora��o buscando a dire��o de DEUS.';
    P[29] := '29 - Posso influenciar pessoas a alcan�arem uma vis�o.';
    P[30] := '30 - Consigo apoiar pacientemente aqueles que atravessam experi�ncias dolorosas, enquanto eles tentam normalizar suas vidas.';
    P[31] := '31 - Sinto necessidade de mostrar �s pessoas as verdades de DEUS.';
    P[32] := '32 - Tento fortalecer �queles que vacilam na f�.';
    P[33] := '33 - Antes de tentar ensinar algo, avalio se, como ouvinte, eu entenderia a id�ia principal pela meneira como vai ser ensinado.';
    P[34] := '34 - Encontro solu��es simples e pr�ticas para as dificuldades.';
    P[35] := '35 - Gosto de definir alvos e desenvolver estrat�gias para realiz�-los.';
    P[36] := '36 - Gostaria de ter um papel ativo no come�o de uma nova igreja.';
    P[37] := '37 - Tenho habilidades artesanais que podem ser usadas pela igreja.';
    P[38] := '38 - Utilizo v�rias express�es art�sticas para comunicar a verdade de DEUS.';
    P[39] := '39 - Encorajo as pessoas que precisam dar passos decisivos na sua f�, na sua fam�lia ou na sua vida.';
    P[40] := '40 - Aproveito todas as oportunidades para falar sobre a salva��o de JESUS CRISTO.';
    P[41] := '41 - Tenho certeza da presen�a e a��o de DEUS em minha vida diariamente.';
    P[42] := '42 - Contribuo com mais que o d�zimo para que o trabalho do reino de DEUS seja realizado.';
    P[43] := '43 - Voluntariamente, gosto de assumir tarefas que possam suprir as necessidades dos outros.';
    P[44] := '44 - Acredito que o SENHOR envia pessoas desconhecidas para que eu as apresente a outras pessoas (� como se eu fosse um elo entre as pessoas que necessitam umas das outras).';
    P[45] := '45 - Eu me coloco no lugar da pessoas por quem intercedo.';
    P[46] := '46 - Sei ajustar meu estilo de lideran�a para que outros fa�am o melhor.';
    P[47] := '47 - Gosto de ajudar as pessoas que s�o consideradas in�teis ou sem esperan�a (casos perdidos).';
    P[48] := '48 - Exponho (aponto, torno p�blico) com ousadia as tend�ncias culturais, os ensinos ou eventos que contradizem os pr�ncipios b�blicos.';
    P[49] := '49 - Gosto de ajudar � pessoa como um todo: socialmente, emocionalmente,e spiritualmente, etc.';
    P[50] := '50 - Pesquiso profundamente um assunto antes de falar sobre ele a algu�m.';
    P[51] := '51 - Tenho facilidade em selecionar o modo de agir mais eficiente dentre v�rias alternativas.';
    P[52] := '52 - Planejo bem o meu dia e deixo pouca coisa acontecer por acaso.';
    P[53] := '53 - Tenho facilidade em adaptar-me a ambientes e culturas diferentes.';
    P[54] := '54 - Sei tornar os ambientes agrad�veis e acolhedores.';
    P[55] := '55 - Vejo no teatro uma maneira criativa de passar uma mensagem a algu�m.';
    P[56] := '56 - Costumo estimular pessoas a sa�rem de suas dificuldades.';
    P[57] := '57 - Fa�o o poss�vel para mostrar que sou crist�o, e, sobretudo, quando me perguntam sobre assutos religiosos.';
    P[58] := '58 - Desafio as pessoas a confiarem em Deus.';
    P[59] := '59 - Administro bem minhas finan�as para poder contribuir mais.';
    P[60] := '60 - Eu me sinto bem auxiliando as pessoas nas suas tarefas.';
    P[61] := '61 - Gosto de criar um ambiente onde as pessoas n�o se sintam sozinhas.';
    P[62] := '62 - Oro com confian�a na a��o de DEUS.';
    P[63] := '63 - Conquisto as pessoas em torno de um objetivo.';
    P[64] := '64 - Tenho compaix�o pelas pessoas que sofrem.';
    P[65] := '65 - Tenho facilidade em apresentar os principios de Deus �s pessoas.';
    P[66] := '66 - Gosto de dar apoio e aten��o �s pessoas.';
    P[67] := '67 - Mais que o assunto apresentado, me chama a aten��o a forma como � apresentado.';
    P[68] := '68 - Reflito nas prov�veis consequ�ncias de uma a��o qualquer.';
    P[69] := '69 - Gosto de desenvolver projetos que envolvam negocia��es e organiza��o.';
    P[70] := '70 - Tenho facilidade em me relacionar com pessoas de outras culturas.';
    P[71] := '71 - Tenho jeito para trabalhos manuais.';
    P[72] := '72 - Normalmente, gosto de estar a s�s para refletir e desenvolver minha imagina��o.';
    P[73] := '73 - As pessoas me pedem opini�o na solu��o dos seus problemas.';
    P[74] := '74 - Procuro oportunidades para conversar com descrentes sobre coisas espirituais.';
    P[75] := '75 - Sinto DEUS controlando tudo, mesmo quando tudo parece perdido.';
    P[76] := '76 - Fico contente em saber que minha contribui��o financiera � significativa na vida do povo de DEUS ou nos minist�rios da igreja.';
    P[77] := '77 - Estou disposto a utilizar meus dons e talentos para ajudar os outros.';
    P[78] := '78 - Gosto de receber pessoas em minha casa.';
    P[79] := '79 - Busco a face de DEUS, diante de uma dificuldade.';
    P[80] := '80 - As pessoas se sentem seguras diante dos meus planos para atingir um alvo.';
    P[81] := '81 - Eu me enxergo nas defici�ncias e nos problemas de uma pessoa.';
    P[82] := '82 - Proclamo a verdade de DEUS, mesmo em lugares onde lea n�o � popular ou aceita.';
    P[83] := '83 - Gosto de nutrir as pessoas em processo de crescimento espiritual, com paci�ncia, mas com firmeza.';
    P[84] := '84 - Quando falo das Escrituras, sinto que os ouvintes s�o motivados a estudar e aprender mais.';
    P[85] := '85 - Dou conselhos capazes de ajudar as pessoas que se encontram em situa��es dif�cies.';
    P[86] := '86 - Gosto de saber como funcionam as organiza��es.';
    P[87] := '87 - Tenho desejo de estudar teologia no smein�rio.';
    P[88] := '88 - Fa�o pequenos consertos em casa e posso fazer o mesmo na igreja.';
    P[89] := '89 - Posso usar a m�mica para comunicar a salva��o.';
    P[90] := '90 - Eu me ponho no lugar das pessoas antes de dar conselhos.';
    P[91] := '91 - Mostro �s pessoas o que JESUS fez por mim e como a minha vida mudou.';
    P[92] := '92 - Eu tenho certeza de minha salva��o, mesmo quando estou triste por haver cometido um pecado.';
    P[93] := '93 - Fico contente em contribuir para obras mission�rias.';
    P[94] := '94 - Eu me sinto realizado ao apoiar pessoas em seus prop�sitos.';
    P[95] := '95 - FA�o o que for poss�vel para que as pessoas se sintam parte do grupo.';
    P[96] := '96 - Sinto-me honrado quando algu�m me pede ora��es.';
    P[97] := '97 - Sinto que as pessoas ficam atentas �s minhas id�ias e decis�es.';
    P[98] := '98 - Gosto de trazer esperan�a e alegria �s pessoas que se encontram em situa��es dif�cies.';
    P[99] := '99 - Quando percebo uma situa��o de pecado, sinto-me compelido a denunci�-la e a conclamar as pessoas envolvidas ao arrependimento.';
    P[100] := '100 - Preocupo-me com o vem-estar espiritual de outros crist�os.';
    P[101] := '101 - Torno f�cil o entendimento de determinados textos ou assuntos.';
    P[102] := '102 - Aplico as verdades b�blicas de modo pr�tico e eficiente aos problemas dos outros.';
    P[103] := '103 - Quando planejo um evento, penso nos eventuais problemas e nas respectivas solu��es.';
    P[104] := '104 - Fico preocupado com a falta de conhecimento doutrin�rio que observo em alguns irm�os.';
    P[105] := '105 - Fico empolgado quando trabalho na arruma��o de um ambiente.';
    P[106] := '106 - Vejo na m�sica uma forma eficiente de falar de DEUS �s pessoas.';
    P[107] := '107 - Sou sincero e imparcial com as pessoas que me pedem opini�o.';
    P[108] := '108 - Sinto facilidade em falar sobre JESUS.';
    P[109] := '109 - Tomo decis�es s� ap�s consultar a DEUS.';
    P[110] := '110 - Acredito que o SENHOR me tem dado recursos em abund�ncia para que eu possa contribuir mais para a Sua obra.';
    P[111] := '111 - Penso em aliviar a carga dos meus irm�os sobrecarregados, dando-lhes um pouco mais de apoio.';
    P[112] := '112 - Consigo fazer as pessoas se sentirem � vontade em ambientes desconhecidos.';
    P[113] := '113 - Coloco tudo diante de DEUS, antes de fazer ou decidir.';
    P[114] := '114 - Quando estou em um grupo, percebo que muitos esperam por mim.';
    P[115] := '115 - Fico triste em saber que algumas pessoas passam dificuldades.';
    P[116] := '116 - Consigo apresentar a Palavra de Deus de forma interessante e fiel.';
    P[117] := '117 - Procuro visitar os irm�os doentes ou ausentes � Igreja.';
    P[118] := '118 - Sinto-me realizado em colaborar na prepara��o de estudos que tornem simples e interessante o aprendizado das pessoas.';
    P[119] := '119 - Dou solu��o a problemas que as pessoas normalmente n�o pensam.';
    P[120] := '120 - Eu me sinto realizado ao realizar os planos para alcan�ar um objetivo definido.';
    P[121] := '121 - Tenho vontade de trabalhar na planta��o de novas igrejas com o fim de alcan�ar mais pessoas.';
    P[122] := '122 - Gosto de resolver problemas pr�ticos, como pequenos consertos que normalmente s�o feitos por t�cnicos especializados.';
    P[123] := '123 - Gosto de cantar ou representar laguns personagens b�blicos.';
    P[124] := '124 - Exponho a verdade, indicando o melhor caminho para sair do erro.';
    P[125] := '125 - Tenho vontade de participar de um treinamento sobre evangelismo.';
    P[126] := '126 - Tenho orado e trabalhado por coisas consideradas imposs�veis.';
    P[127] := '127 - Participo de manuten��o de miss�es ou de outros minist�rios.';
    P[128] := '128 - Sinto que � o momento de colocar meus dons e talentos a servi�o da igreja.';
    P[129] := '129 - Ofere�o um ambiente agrad�vel na minha casa, mesmo a pessoas desconhecidas.';
    P[130] := '130 - Coloco diante de DEUS todas decis�es que preciso tomar.';
    P[131] := '131 - As pessoas me indicam para dirigir alguns trabalhos.';
    P[132] := '132 - Ajudo pessoas com necessidades, independente dos motivos.';
    P[133] := '133 - Medito e exponho claramente os textos b�blicos.';
    P[134] := '134 - Corrijo o irm�o que esteja vivendo de maneira n�o conforme.';
    P[135] := '135 - Eu me preocupo em saber se houve pleno entendimento das id�ias que eu quis passar.';
    P[136] := '136 - Gosto de levar pessoas a refletirem sobre a suas itua��o.';
    P[137] := '137 - Tenho vontade de me envolver nos projetos da igreja ajudando a organiz�-los e implement�-los.';
    P[138] := '138 - Gosto de esclarecer grupos de pessoas, com d�vidas em assuntos b�blicos.';
    P[139] := '139 - Gosto de ajudar �s pessoas com minhas habilidades manuais.';
    P[140] := '140 - Na �poca de estudante trabalhei com teatro, canto ou dan�a.';
    P[141] := '141 - Costumo dar minha opini�o s� ap�s avaliar completamente os fatos.';
    P[142] := '142 - Fui usado por DEUS na convers�o de algumas pessoas.';
    P[143] := '143 - Mesmo tudo dando errado, sigo em frente se achar que � plano de DEUS.';
    P[144] := '144 - Eu me sinto tocado quando ou�o sobre necessidades financeiras de outras pessoas.';
    P[145] := '145 - Eu me ofere�o para ajudar em alguma atividade quando vejo que � necess�rio.';
    P[146] := '146 - Observo que muitas pessoas se sentem bem � vontade em minha companhia.';
    P[147] := '147 - Sinto Deus responder �s minhas ora��es.';
    P[148] := '148 - Quando o grupo de que participo fica sem l�der, tomo a iniciativa).';
    P[149] := '149 - Fico feliz quando algu�m sai de alguma dificuldade gra�as a minha ajuda.';
    P[150] := '150 - Gosto de levar as pessoas a meditarem nas verdades de Deus.';
    P[151] := '151 - Percebo as coisas certas e erradas nas situa��es,e tento corrigi-las com um conselho.';
    P[152] := '152 - Eu me esfor�o para conseguir uma comunica��o com muita clareza.';
    P[153] := '153 - Assim que percebo algo errado, procuro uma solu��o r�pida, por�m discreta.';
    P[154] := '154 - Tenho vontade de participar de treinamentos que me ajudem a melhorar as minhas habilidades de organizar e administrar tarefas.';
    P[155] := '155 - Estou sempre analisando o que � ministrado nos estudos e na prega��o.';
    P[156] := '156 - Tenho pr�tica em arranjos e decora��es ambientais.';
    P[157] := '157 - Em crian�a, eu gostava de cantar ou dan�ar imitando artisitas da TV.';
    P[158] := '158 - Descubro o potencial das pessoas logo nos primeiros contatos.';
    P[159] := '159 - Falo sobre o amor de Deus na esperan�a de que Ele pode agir.';
    P[160] := '160 - Eu aceito e defendo todas as afirma��es da B�blia, mesmo as que eu n�o posso explicar.';
    P[161] := '161 - Al�m do d�zimo, eu gosto de participar com ofertas para o reino de Deus.';
    P[162] := '162 - Contribuo com novas sugest�es � lideran�a.';
    P[163] := '163 - Consigo transmitir aos visitantes a sensa��o de bem-estar e de que est�o em suas pr�prias casas ou em suas igrejas.';
    P[164] := '164 - Gosto de participar de reuni�es de ora��o.';
    P[165] := '165 - Sou indicado (ou chamado) para coordenar algum trabalho, qaundo menos espero.';
    P[166] := '166 - Quando n�o posso ajudar algu�m com dificuldades, busco a ajuda de outros.';
    P[167] := '167 - Preparo textos de medita��o para oportunamente apresent�-los a algu�m.';
    P[168] := '168 - Procuro saber por que um irm�o ou irm� n�o est� vindo � igreja.';
    P[169] := '169 - Antes de ensinar algo a algu�m, eu avalio sobre o entendimento de cada ponto.';
    P[170] := '170 - Priorizo a solu��o das quest�es mais simples e f�ceis.';
end;

procedure TForm1.btIniciarClick(Sender: TObject);
var
  k: integer;
begin
    ordem := 0;
    col := 0;
    //Ativa bot�es de respostas
    btMuitoSempre.Enabled:=True;
    btasVezesAlguma.Enabled:=True;
    btPoucoRaramente.Enabled:=True;
    btNuncaNao.Enabled:=True;
    ordem := ordem + 1;

    lblnumero.Visible:=True;
    lblnumero.Caption := IntToStr(ordem) + '/170';
    lblquestao.Caption := P[ordem];

    For K:= 1 To 17 do
        resultado[K]:= 0;

    btIniciar.Enabled := False;
   
end;


procedure TForm1.escolha(numero: integer);
begin
    If (ordem <= 169) Then
    begin
       ordem := ordem + 1;
       col := col + 1;
       lblnumero.Caption := IntToStr(ordem) + '/170';
       lblquestao.Caption := P[ordem];
       Case col of
          1: resultado[1] := resultado[1] + numero;
          2: resultado[2] := resultado[2] + numero;
          3: resultado[3] := resultado[3] + numero;
          4: resultado[4] := resultado[4] + numero;
          5: resultado[5] := resultado[5] + numero;
          6: resultado[6] := resultado[6] + numero;
          7: resultado[7] := resultado[7] + numero;
          8: resultado[8] := resultado[8] + numero;
          9: resultado[9] := resultado[9] + numero;
          10:resultado[10] := resultado[10] + numero;
          11:resultado[11] := resultado[11] + numero;
          12:resultado[12] := resultado[12] + numero;
          13:resultado[13] := resultado[13] + numero;
          14:resultado[14] := resultado[14] + numero;
          15:resultado[15] := resultado[15] + numero;
          16:resultado[16] := resultado[16] + numero;
          17:resultado[17] := resultado[17] + numero;
        End;

        If (col = 17) Then
        begin
           col := 0;
        End;
        
    end
    else
    begin

      //Desativar bot�es de respostas
      btMuitoSempre.Enabled:=False;
      btasVezesAlguma.Enabled:=False;
      btPoucoRaramente.Enabled:=False;
      btNuncaNao.Enabled:=False;
      btIniciar.Enabled := False;
      lblnumero.Caption := '000';
      lblquestao.Caption := '';
      Image1.Visible := False;
      lblnumero.Visible:=False;
      mostraDons;
      showmessage('Conclu�do, Deus aben��e o seu minist�rio!');

    end;
end;

procedure TForm1.btMuitoSempreClick(Sender: TObject);
begin
    escolha(3);
end;

procedure TForm1.btasVezesAlgumaClick(Sender: TObject);
begin
  escolha(2);
end;

procedure TForm1.btPoucoRaramenteClick(Sender: TObject);
begin
  escolha(1);
end;

procedure TForm1.btNuncaNaoClick(Sender: TObject);
begin
  escolha(0);
end;


procedure TForm1.mostraDons;
var
  maior: array[1..4] of integer;
  posicao: array[1..4] of integer;
  dom: integer;
  classificacao:integer;
begin
  //Encontrar os 4 numeros maiores e guardar suas posi��es
  maior[1]:=0;
  maior[2]:=0;
  maior[3]:=0;
  maior[4]:=0;

 
  //PRIMEIRO DOM
  For dom:= 1 To 17 do
  begin
      if (resultado[dom] > maior[1]) then
      begin
          maior[1]:=resultado[dom];
          posicao[1]:=dom;
      end;
  end;

  //SEGUNDO DOM
  For dom:= 1 To 17 do
  begin
     if (dom <> posicao[1]) then
     begin
        if (resultado[dom]=maior[1]) then
        begin
          maior[2]:=maior[1]; //sao iguais valores
          posicao[2]:=dom;    //posicoes diferentes outro dom
        end
        else
        begin
          if ((resultado[dom] < maior[1]) and (resultado[dom] > maior[2])) then
          begin
            maior[2]:=resultado[dom]; //� valor menor abaixo do primeiro
            posicao[2]:=dom;    //posicao diferentes outro dom
          end;
        end;
     end;
  end;

  //TERCEIRO DOM
  For dom:= 1 To 17 do
  begin
     if ((dom <> posicao[1]) and (dom <> posicao[2])) then
     begin
        if (resultado[dom] = maior[2]) then
        begin
          maior[3]:=maior[2]; //sao iguais valores
          posicao[3]:=dom;    //posicoes diferentes outro dom
        end
        else
        begin
          if ((resultado[dom] < maior[2]) and (resultado[dom] > maior[3])) then
          begin
            maior[3]:=resultado[dom]; //� valor menor abaixo do segundo
            posicao[3]:=dom;          //posicao diferentes outro dom
          end;
        end;
     end;
  end;

  //QUARTO DOM
  For dom:= 1 To 17 do
  begin
     if ((dom <> posicao[1]) and (dom <> posicao[2]) and (dom <> posicao[3]))then
     begin
        if (resultado[dom]=maior[3]) then
        begin
          maior[4]:=maior[3]; //sao iguais valores
          posicao[4]:=dom;    //posicoes diferentes outro dom
        end
        else
        begin
          if ((resultado[dom] < maior[3]) and (resultado[dom] > maior[4])) then
          begin
            maior[4]:=resultado[dom]; //� valor menor abaixo do segundo
            posicao[4]:=dom;          //posicao diferentes outro dom
          end;
        end;
     end;
  end;

   for classificacao:=1 to 4 do   //desligar transparente para colorir
  begin
      Case posicao[classificacao] of
          1: valorA.Transparent := false;
          2: valorB.Transparent := false;
          3: valorC.Transparent := false;
          4: valorD.Transparent := false;
          5: valorE.Transparent := false;
          6: valorF.Transparent := false;
          7: valorG.Transparent := false;
          8: valorH.Transparent := false;
          9: valorI.Transparent := false;
          10:valorJ.Transparent := false;
          11:valorL.Transparent := false;
          12:valorM.Transparent := false;
          13:valorN.Transparent := false;
          14:valorO.Transparent := false;
          15:valorP.Transparent := false;
          16:valorQ.Transparent := false;
          17:valorR.Transparent := false;
       End;
  end;

  for classificacao:=1 to 4 do   //colorir 4 dons
  begin
      Case posicao[classificacao] of
          1: valorA.Color := clYellow;
          2: valorB.Color := clYellow;
          3: valorC.Color := clYellow;
          4: valorD.Color := clYellow;
          5: valorE.Color := clYellow;
          6: valorF.Color := clYellow;
          7: valorG.Color := clYellow;
          8: valorH.Color := clYellow;
          9: valorI.Color := clYellow;
          10:valorJ.Color := clYellow;
          11:valorL.Color := clYellow;
          12:valorM.Color := clYellow;
          13:valorN.Color := clYellow;
          14:valorO.Color := clYellow;
          15:valorP.Color := clYellow;
          16:valorQ.Color := clYellow;
          17:valorR.Color := clYellow;
       End;
  end;

end;

procedure TForm1.sSpeedButtonSairClick(Sender: TObject);
begin
   Close;
end;

end.
