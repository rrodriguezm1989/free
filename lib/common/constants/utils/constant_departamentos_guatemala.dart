var departamentosMunicipios = [
  [
    "Guatemala",
    [
      "Amatitlán",
      "San José Pinula",
      "Chinautla",
      "San Juan Sacatepéquez",
      "Chuarrancho",
      "San Miguel Petapa",
      "Ciudad de Guatemala",
      "San Pedro Ayampuc",
      "Fraijanes",
      "San Pedro Sacatepéquez",
      "Mixco",
      "San Raymundo",
      "Palencia",
      "Santa Catarina Pinula",
      "San José del Golfo",
      "Villa Canales",
      "Villa Nueva"
    ]
  ],
  [
    "Alta Verapaz",
    [
      "Cobán Cabecera",
      "Tactic",
      "Santa Cruz Verapaz",
      "San Juan Chamelco",
      "San Cristóbal Verapaz",
      "San Pedro Carchá",
      "Tamahú",
      "Tucurú",
      "Panzos",
      "Santa María Cahabón",
      "Lanquín",
      "Chisec",
      "Fray Bartolomé de las Casas",
      "Senahú",
      "Santa Catalina la Tinta",
      "Chaal",
      "Raxruhá"
    ]
  ],
  [
    "Chimaltenago",
    [
      "Chimaltenango",
      "San Juan Comalapa",
      "El Tejar",
      "San Martín Jilotepeque",
      "Parramos",
      "Santa Apolonia",
      "Patzicía",
      "Santa Cruz Balanyá"
          "Patzún",
      "Tecpán",
      "Pochuta",
      "Yepocapa",
      "San Andrés Itzapa	",
      "Zaragoza"
    ]
  ],
  [
    "El Progreso",
    [
      "El Jícaro",
      "Guastatoya",
      "Morazán",
      "San Agustín Acasaguastlán",
      "San Antonio La Paz",
      "San Cristóbal Acasaguastlán",
      "Sanarate",
      "Sansare"
    ],
  ],
  [
    "Escuintla",
    [
      "Escuintla",
      "Guanagazapa",
      "Iztapa",
      "La Democracia",
      "La Gomera",
      "Masagua",
      "Nueva Concepción",
      "Palín",
      "San José",
      "San Vicente Pacaya",
      "Santa Lucía Cotzumalguapa",
      "Sipacate",
      "Siquinalá",
      "Tiquisate"
    ]
  ]
];

var departamentos = departamentosMunicipios.map((e) => e[0].toString());
Function municipiosDepartamento = (index) => departamentosMunicipios[index][1];
