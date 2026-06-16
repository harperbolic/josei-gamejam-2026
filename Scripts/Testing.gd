extends Node

var dialog_lines : Dictionary = {
  "0": {
	"name": "Helena",
	"expression": "Happy",
	"text": "E aí, o que te traz ao nosso pequeno fim de mundo?"
  },
  "1": {
	"name": "",
	"expression": "",
	"text": "..."
  },
  "2": {
	"name": "Helena",
	"expression": "Worried",
	"text": "Ah, não. Você teve uma visão, né?"
  },
  "3": {
	"name": "",
	"expression": "",
	"text": "Infelizmente."
  },
  "4": {
	"name": "Helena",
	"expression": "Worried",
	"text": "Quão ruim?"
  },
  "5": {
	"name": "",
	"expression": "",
	"text": "Bem... sangrento. Eu não consegui entender direito. Tinham pessoas gritando, um rugido estranho…"
  },
  "6": {
	"name": "",
	"expression": "",
	"text": "Eu só sei que vai acontecer algo na festa junina da igreja."
  },
  "7": {
	"name": "Helena",
	"expression": "Worried",
	"text": "É hoje à noite."
  },
  "8": {
	"name": "",
	"expression": "",
	"text": "Eu sei. Eu vim pra cá o quanto antes. Não podia deixar algo assim acontecer com a nossa cidade, mesmo que eu tenha minhas questões com ela."
  },
  "9": {
	"name": "Helena",
	"expression": "Worried",
	"text": "E você... tem certeza de que vai acontecer?"
  },
  "10": {
	"name": "",
	"expression": "",
	"text": "Se não fizermos nada, provavelmente. Mas a gente já conseguiu impedir minhas visões antes."
  },
  "11": {
	"name": "Helena",
	"expression": "Worried",
	"text": "Eu sei, mas... eram coisas como acidentes de ônibus, incêndios. Isso que você tá descrevendo parece..."
  },
  "12": {
	"name": "",
	"expression": "",
	"text": "Sobrenatural?"
  },
  "13": {
	"name": "Helena",
	"expression": "Worried",
	"text": "Bem... é."
  },
  "14": {
	"name": "",
	"expression": "",
	"text": "Bom, ter visões do futuro não é algo exatamente natural, é?"
  },
  "15": {
	"name": "Helena",
	"expression": "Worried",
	"text": "É, tem razão..."
  },
  "16": {
	"name": "Helena",
	"expression": "Worried",
	"text": "Poxa, eu tive TANTO trabalho pra colocar Terra Rubra nos eixos."
  },
  "17": {
	"name": "Helena",
	"expression": "Worried",
	"text": "E agora você me diz que vamos ter que enfrentar um monstro ou alienígena ou seja lá o que for?"
  }
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialog.start_dialog(dialog_lines)
