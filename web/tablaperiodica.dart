import 'dart:html';

var file;
UListElement colorElementList;

void main() {
  OnDataLoaded();
  var info = {
              'alkali' : 'Alcalinos',
              'alcalinoterreos' : 'Alcalinoterreos',
              'metalestransicion' : 'Metales Transicion',
              'lantanidos' : 'Lantanidos',
              'actinidos' : 'Actinidos',
              'metalesbloquep' : 'Metales Bloque P',
              'nometales' : 'No metales',
              'gasesnobles' : 'Gases Nobles',
              
              
  };
  info.forEach((id,text) => LoadList(text,id));
}
void LoadList(String mapInfoText,String mapInfoId){
  colorElementList = querySelector("#colorElementList");
  var newElement = new LIElement();
  newElement.text = mapInfoText;
  newElement.id = mapInfoId;
  colorElementList.children.add(newElement);
  
}

void OnDataLoaded()
{
  DataLoad();
  var table = CreateTable();
  var row = table.insertRow(-1); 
  var groups = new Iterable.generate(file["table"].length, (i) => i);
  
  //Main elements
  for(var grupo in groups)
  {
    var elems = new Iterable.generate(file["table"][grupo]["elements"].length, (i) => i);
    for(var ele in elems){
    var elemento = file["table"][grupo]["elements"][ele];
    AddElements(elemento,table,row);
  }
  }
  
  //Lanthanoids
  var totalLanthanoids = new Iterable.generate(file["lanthanoids"].length, (i) => i);
      for(var position in totalLanthanoids)
      {
          var lanthanoidElement = file["lanthanoids"][position];
          AddElements(lanthanoidElement,table,row);
      }
  //Actinoids
  var totalActinoids = new Iterable.generate(file["actinoids"].length, (i) => i);
      for(var position in totalActinoids)
      {
          var actinoidElement = file["actinoids"][position];
          AddElements(actinoidElement,table,row);
      }
  document.body.nodes.add(table);
}

TableElement CreateTable()
{
  TableElement table = new TableElement();
  table.id = "elements";
  var tBody = table.createTBody();
  return table;
}

var counter = 0;

void AddElements(var element,TableElement table,TableRowElement row)
{
  var picCell = row.insertCell(-1);
  var cssClass = element["group"];
  var invisibleBoxes;
  if(element["number"] == 1){
  var auxPicCell = row.insertCell(-1);
  invisibleBoxes = "";
  auxPicCell.setInnerHtml(invisibleBoxes);
  }
  else{
    invisibleBoxes = " ";
  }
  //Fuck ModelViewController :s
  
  String html =
      '<div class="element $cssClass">' + 
      '<div >' + element["number"].toString() + ' </div>'
      '<div class="symbol">' + element["small"] + ' </div>'+
      '<div class="info">' + element["name"] + ' </div>' +
      '<div class="info">' + element["molar"].toString() + ' </div>'
      '</div>';
  picCell.setInnerHtml(html);
  counter++;
}

void DataLoad(){
  file = {
              "table": [
                        {
                          "wiki": "http://en.wikipedia.org/wiki/Period%201%20element",
                          "elements": [
                                       {
                                         "group": "none",
                                         "position": 0,
                                         "number": 1,
                                         "name": "Hydrogen",
                                         "molar": 1.00794,
                                         "small": "H",
                                         "electrons": [
                                                       1
                                                       ]
                                       },
                                       {
                                         "group": "gasesnobles",
                                         "position": 17,
                                         "number": 2,
                                         "name": "Helium",
                                         "molar": 4.002602,
                                         "small": "He",
                                         "electrons": [
                                                       2
                                                       ]
                                       }
                                       ]
                        },
                        {
                          "wiki": "http://en.wikipedia.org/wiki/Period%202%20element",
                          "elements": [
                                       {
                                         "group": "alkali",
                                         "position": 0,
                                         "name": "Lithium",
                                         "number": 3,
                                         "small": "Li",
                                         "molar": 6.941,
                                         "electrons": [
                                                       2,
                                                       1
                                                       ]
                                       },
                                       {
                                         "group": "alcalinoterreos",
                                         "position": 1,
                                         "name": "Beryllium",
                                         "number": 4,
                                         "small": "Be",
                                         "molar": 9.012182,
                                         "electrons": [
                                                       2,
                                                       2
                                                       ]
                                       },
                                       {
                                         "group": "nometales",
                                         "position": 12,
                                         "name": "Boron",
                                         "number": 5,
                                         "small": "B",
                                         "molar": 10.811,
                                         "electrons": [
                                                       2,
                                                       3
                                                       ]
                                       },
                                       {
                                         "group": "nometales",
                                         "position": 13,
                                         "name": "Carbon",
                                         "number": 6,
                                         "small": "C",
                                         "molar": 12.0107,
                                         "electrons": [
                                                       2,
                                                       4
                                                       ]
                                       },
                                       {
                                         "group": "nometales",
                                         "position": 14,
                                         "name": "Nitrogen",
                                         "number": 7,
                                         "small": "N",
                                         "molar": 14.0067,
                                         "electrons": [
                                                       2,
                                                       5
                                                       ]
                                       },
                                       {
                                         "group": "nometales",
                                         "position": 15,
                                         "name": "Oxygen",
                                         "number": 8,
                                         "small": "O",
                                         "molar": 15.9994,
                                         "electrons": [
                                                       2,
                                                       6
                                                       ]
                                       },
                                       {
                                         "group": "nometales",
                                         "position": 16,
                                         "name": "Fluorine",
                                         "number": 9,
                                         "small": "F",
                                         "molar": 18.998404,
                                         "electrons": [
                                                       2,
                                                       7
                                                       ]
                                       },
                                       {
                                         "group": "gasesnobles",
                                         "position": 17,
                                         "name": "Neon",
                                         "number": 10,
                                         "small": "Ne",
                                         "molar": 20.1797,
                                         "electrons": [
                                                       2,
                                                       8
                                                       ]
                                       }
                                       ]
                        },
                        {
                          "wiki": "http://en.wikipedia.org/wiki/Period%203%20element",
                          "elements": [
                                       {
                                         "group": "alkali",
                                         "position": 0,
                                         "name": "Sodium",
                                         "number": 11,
                                         "small": "Na",
                                         "molar": 22.989769,
                                         "electrons": [
                                                       2,
                                                       8,
                                                       1
                                                       ]
                                       },
                                       {
                                         "group": "alcalinoterreos",
                                         "position": 1,
                                         "name": "Magnesium",
                                         "number": 12,
                                         "small": "Mg",
                                         "molar": 24.305,
                                         "electrons": [
                                                       2,
                                                       8,
                                                       2
                                                       ]
                                       },
                                       {
                                         "group": "metalesbloquep",
                                         "position": 12,
                                         "name": "Aluminium",
                                         "number": 13,
                                         "small": "Al",
                                         "molar": 26.981539,
                                         "electrons": [
                                                       2,
                                                       8,
                                                       3
                                                       ]
                                       },
                                       {
                                         "group": "nometales",
                                         "position": 13,
                                         "name": "Silicon",
                                         "number": 14,
                                         "small": "Si",
                                         "molar": 28.0855,
                                         "electrons": [
                                                       2,
                                                       8,
                                                       4
                                                       ]
                                       },
                                       {
                                         "group": "nometales",
                                         "position": 14,
                                         "name": "Phosphorus",
                                         "number": 15,
                                         "small": "P",
                                         "molar": 30.973763,
                                         "electrons": [
                                                       2,
                                                       8,
                                                       5
                                                       ]
                                       },
                                       {
                                         "group": "nometales",
                                         "position": 15,
                                         "name": "Sulfur",
                                         "number": 16,
                                         "small": "S",
                                         "molar": 32.065,
                                         "electrons": [
                                                       2,
                                                       8,
                                                       6
                                                       ]
                                       },
                                       {
                                         "group": "nometales",
                                         "position": 16,
                                         "name": "Chlorine",
                                         "number": 17,
                                         "small": "Cl",
                                         "molar": 35.453,
                                         "electrons": [
                                                       2,
                                                       8,
                                                       7
                                                       ]
                                       },
                                       {
                                         "group": "gasesnobles",
                                         "position": 17,
                                         "name": "Argon",
                                         "number": 18,
                                         "small": "Ar",
                                         "molar": 39.948,
                                         "electrons": [
                                                       2,
                                                       8,
                                                       8
                                                       ]
                                       }
                                       ]
                        },
                        {
                          "wiki": "http://en.wikipedia.org/wiki/Period%204%20element",
                          "elements": [
                                       {
                                         "group": "alkali",
                                         "position": 0,
                                         "name": "Potassium",
                                         "number": 19,
                                         "small": "K",
                                         "molar": 39.0983,
                                         "electrons": [
                                                       2,
                                                       8,
                                                       8,
                                                       1
                                                       ]
                                       },
                                       {
                                         "group": "alcalinoterreos",
                                         "position": 1,
                                         "name": "Calcium",
                                         "number": 20,
                                         "small": "Ca",
                                         "molar": 40.078,
                                         "electrons": [
                                                       2,
                                                       8,
                                                       8,
                                                       2
                                                       ]
                                       },
                                       {
                                         "group": "metalestransicion",
                                         "position": 2,
                                         "name": "Scandium",
                                         "number": 21,
                                         "small": "Sc",
                                         "molar": 44.955914,
                                         "electrons": [
                                                       2,
                                                       8,
                                                       9,
                                                       2
                                                       ]
                                       },
                                       {
                                         "group": "metalestransicion",
                                         "position": 3,
                                         "name": "Titanium",
                                         "number": 22,
                                         "small": "Ti",
                                         "molar": 47.867,
                                         "electrons": [
                                                       2,
                                                       8,
                                                       10,
                                                       2
                                                       ]
                                       },
                                       {
                                         "group": "metalestransicion",
                                         "position": 4,
                                         "name": "Vanadium",
                                         "number": 23,
                                         "small": "V",
                                         "molar": 50.9415,
                                         "electrons": [
                                                       2,
                                                       8,
                                                       11,
                                                       2
                                                       ]
                                       },
                                       {
                                         "group": "metalestransicion",
                                         "position": 5,
                                         "name": "Chromium",
                                         "number": 24,
                                         "small": "Cr",
                                         "molar": 51.9961,
                                         "electrons": [
                                                       2,
                                                       8,
                                                       13,
                                                       1
                                                       ]
                                       },
                                       {
                                         "group": "metalestransicion",
                                         "position": 6,
                                         "name": "Manganese",
                                         "number": 25,
                                         "small": "Mn",
                                         "molar": 54.938046,
                                         "electrons": [
                                                       2,
                                                       8,
                                                       13,
                                                       2
                                                       ]
                                       },
                                       {
                                         "group": "metalestransicion",
                                         "position": 7,
                                         "name": "Iron",
                                         "number": 26,
                                         "small": "Fe",
                                         "molar": 55.845,
                                         "electrons": [
                                                       2,
                                                       8,
                                                       14,
                                                       2
                                                       ]
                                       },
                                       {
                                         "group": "metalestransicion",
                                         "position": 8,
                                         "name": "Cobalt",
                                         "number": 27,
                                         "small": "Co",
                                         "molar": 58.933193,
                                         "electrons": [
                                                       2,
                                                       8,
                                                       15,
                                                       2
                                                       ]
                                       },
                                       {
                                         "group": "metalestransicion",
                                         "position": 9,
                                         "name": "Nickel",
                                         "number": 28,
                                         "small": "Ni",
                                         "molar": 58.6934,
                                         "electrons": [
                                                       2,
                                                       8,
                                                       16,
                                                       2
                                                       ]
                                       },
                                       {
                                         "group": "metalestransicion",
                                         "position": 10,
                                         "name": "Copper",
                                         "number": 29,
                                         "small": "Cu",
                                         "molar": 63.546,
                                         "electrons": [
                                                       2,
                                                       8,
                                                       18,
                                                       1
                                                       ]
                                       },
                                       {
                                         "group": "metalestransicion",
                                         "position": 11,
                                         "name": "Zinc",
                                         "number": 30,
                                         "small": "Zn",
                                         "molar": 65.38,
                                         "electrons": [
                                                       2,
                                                       8,
                                                       18,
                                                       2
                                                       ]
                                       },
                                       {
                                         "group": "metalesbloquep",
                                         "position": 12,
                                         "name": "Gallium",
                                         "number": 31,
                                         "small": "Ga",
                                         "molar": 69.723,
                                         "electrons": [
                                                       2,
                                                       8,
                                                       18,
                                                       3
                                                       ]
                                       },
                                       {
                                         "group": "metalesbloquep",
                                         "position": 13,
                                         "name": "Germanium",
                                         "number": 32,
                                         "small": "Ge",
                                         "molar": 72.63,
                                         "electrons": [
                                                       2,
                                                       8,
                                                       18,
                                                       4
                                                       ]
                                       },
                                       {
                                         "group": "nometales",
                                         "position": 14,
                                         "name": "Arsenic",
                                         "number": 33,
                                         "small": "As",
                                         "molar": 74.9216,
                                         "electrons": [
                                                       2,
                                                       8,
                                                       18,
                                                       5
                                                       ]
                                       },
                                       {
                                         "group": "nometales",
                                         "position": 15,
                                         "name": "Selenium",
                                         "number": 34,
                                         "small": "Se",
                                         "molar": 78.96,
                                         "electrons": [
                                                       2,
                                                       8,
                                                       18,
                                                       6
                                                       ]
                                       },
                                       {
                                         "group": "nometales",
                                         "position": 16,
                                         "name": "Bromine",
                                         "number": 35,
                                         "small": "Br",
                                         "molar": 79.904,
                                         "electrons": [
                                                       2,
                                                       8,
                                                       18,
                                                       7
                                                       ]
                                       },
                                       {
                                         "group": "gasesnobles",
                                         "position": 17,
                                         "name": "Krypton",
                                         "number": 36,
                                         "small": "Kr",
                                         "molar": 83.798,
                                         "electrons": [
                                                       2,
                                                       8,
                                                       18,
                                                       8
                                                       ]
                                       }
                                       ]
                        },
                        {
                          "wiki": "http://en.wikipedia.org/wiki/Period%205%20element",
                          "elements": [
                                       {
                                         "group": "alkali",
                                         "position": 0,
                                         "name": "Rubidium",
                                         "number": 37,
                                         "small": "Rb",
                                         "molar": 85.4678,
                                         "electrons": [
                                                       2,
                                                       8,
                                                       18,
                                                       8,
                                                       1
                                                       ]
                                       },
                                       {
                                         "group": "alcalinoterreos",
                                         "position": 1,
                                         "name": "Strontium",
                                         "number": 38,
                                         "small": "Sr",
                                         "molar": 87.62,
                                         "electrons": [
                                                       2,
                                                       8,
                                                       18,
                                                       8,
                                                       2
                                                       ]
                                       },
                                       {
                                         "group": "metalestransicion",
                                         "position": 2,
                                         "name": "Yttrium",
                                         "number": 39,
                                         "small": "Y",
                                         "molar": 88.90585,
                                         "electrons": [
                                                       2,
                                                       8,
                                                       18,
                                                       9,
                                                       2
                                                       ]
                                       },
                                       {
                                         "group": "metalestransicion",
                                         "position": 3,
                                         "name": "Zirconium",
                                         "number": 40,
                                         "small": "Zr",
                                         "molar": 91.224,
                                         "electrons": [
                                                       2,
                                                       8,
                                                       18,
                                                       10,
                                                       2
                                                       ]
                                       },
                                       {
                                         "group": "metalestransicion",
                                         "position": 4,
                                         "name": "Niobium",
                                         "number": 41,
                                         "small": "Nb",
                                         "molar": 92.90638,
                                         "electrons": [
                                                       2,
                                                       8,
                                                       18,
                                                       12,
                                                       1
                                                       ]
                                       },
                                       {
                                         "group": "metalestransicion",
                                         "position": 5,
                                         "name": "Molybdenum",
                                         "number": 42,
                                         "small": "Mo",
                                         "molar": 95.96,
                                         "electrons": [
                                                       2,
                                                       8,
                                                       18,
                                                       13,
                                                       1
                                                       ]
                                       },
                                       {
                                         "group": "metalestransicion",
                                         "position": 6,
                                         "name": "Technetium",
                                         "number": 43,
                                         "small": "Tc",
                                         "molar": 98,
                                         "electrons": [
                                                       2,
                                                       8,
                                                       18,
                                                       13,
                                                       2
                                                       ]
                                       },
                                       {
                                         "group": "metalestransicion",
                                         "position": 7,
                                         "name": "Ruthenium",
                                         "number": 44,
                                         "small": "Ru",
                                         "molar": 101.07,
                                         "electrons": [
                                                       2,
                                                       8,
                                                       18,
                                                       15,
                                                       1
                                                       ]
                                       },
                                       {
                                         "group": "metalestransicion",
                                         "position": 8,
                                         "name": "Rhodium",
                                         "number": 45,
                                         "small": "Rh",
                                         "molar": 102.9055,
                                         "electrons": [
                                                       2,
                                                       8,
                                                       18,
                                                       16,
                                                       1
                                                       ]
                                       },
                                       {
                                         "group": "metalestransicion",
                                         "position": 9,
                                         "name": "Palladium",
                                         "number": 46,
                                         "small": "Pd",
                                         "molar": 106.42,
                                         "electrons": [
                                                       2,
                                                       8,
                                                       18,
                                                       18
                                                       ]
                                       },
                                       {
                                         "group": "metalestransicion",
                                         "position": 10,
                                         "name": "Silver",
                                         "number": 47,
                                         "small": "Ag",
                                         "molar": 107.8682,
                                         "electrons": [
                                                       2,
                                                       8,
                                                       18,
                                                       18,
                                                       1
                                                       ]
                                       },
                                       {
                                         "group": "metalestransicion",
                                         "position": 11,
                                         "name": "Cadmium",
                                         "number": 48,
                                         "small": "Cd",
                                         "molar": 112.411,
                                         "electrons": [
                                                       2,
                                                       8,
                                                       18,
                                                       18,
                                                       2
                                                       ]
                                       },
                                       {
                                         "group": "metalesbloquep",
                                         "position": 12,
                                         "name": "Indium",
                                         "number": 49,
                                         "small": "In",
                                         "molar": 114.818,
                                         "electrons": [
                                                       2,
                                                       8,
                                                       18,
                                                       18,
                                                       3
                                                       ]
                                       },
                                       {
                                         "group": "metalesbloquep",
                                         "position": 13,
                                         "name": "Tin",
                                         "number": 50,
                                         "small": "Sn",
                                         "molar": 118.71,
                                         "electrons": [
                                                       2,
                                                       8,
                                                       18,
                                                       18,
                                                       4
                                                       ]
                                       },
                                       {
                                         "group": "nometales",
                                         "position": 14,
                                         "name": "Antimony",
                                         "number": 51,
                                         "small": "Sb",
                                         "molar": 121.76,
                                         "electrons": [
                                                       2,
                                                       8,
                                                       18,
                                                       18,
                                                       5
                                                       ]
                                       },
                                       {
                                         "group": "nometales",
                                         "position": 15,
                                         "name": "Tellurium",
                                         "number": 52,
                                         "small": "Te",
                                         "molar": 127.6,
                                         "electrons": [
                                                       2,
                                                       8,
                                                       18,
                                                       18,
                                                       6
                                                       ]
                                       },
                                       {
                                         "group": "nometales",
                                         "position": 16,
                                         "name": "Iodine",
                                         "number": 53,
                                         "small": "I",
                                         "molar": 126.90447,
                                         "electrons": [
                                                       2,
                                                       8,
                                                       18,
                                                       18,
                                                       7
                                                       ]
                                       },
                                       {
                                         "group": "gasesnobles",
                                         "position": 17,
                                         "name": "Xenon",
                                         "number": 54,
                                         "small": "Xe",
                                         "molar": 131.293,
                                         "electrons": [
                                                       2,
                                                       8,
                                                       18,
                                                       18,
                                                       8
                                                       ]
                                       }
                                       ]
                        },
                        {
                          "wiki": "http://en.wikipedia.org/wiki/Period%206%20element",
                          "elements": [
                                       {
                                         "group": "alkali",
                                         "position": 0,
                                         "name": "Caesium",
                                         "number": 55,
                                         "small": "Cs",
                                         "molar": 132.90546,
                                         "electrons": [
                                                       2,
                                                       8,
                                                       18,
                                                       18,
                                                       8,
                                                       1
                                                       ]
                                       },
                                       {
                                         "group": "alcalinoterreos",
                                         "position": 1,
                                         "name": "Barium",
                                         "number": 56,
                                         "small": "Ba",
                                         "molar": 137.327,
                                         "electrons": [
                                                       2,
                                                       8,
                                                       18,
                                                       18,
                                                       8,
                                                       2
                                                       ]
                                       },
                                       {
                                         "group": "Lanthanoid InnerBorder BlueLeft BlueTop BlueRight",
                                         "position": 2,
                                         "name": "",
                                         "number": "",
                                         "small": "57-71"
                                       },
                                       {
                                         "group": "metalestransicion",
                                         "position": 3,
                                         "name": "Hafnium",
                                         "number": 72,
                                         "small": "Hf",
                                         "molar": 178.49,
                                         "electrons": [
                                                       2,
                                                       8,
                                                       18,
                                                       32,
                                                       10,
                                                       2
                                                       ]
                                       },
                                       {
                                         "group": "metalestransicion",
                                         "position": 4,
                                         "name": "Tantalum",
                                         "number": 73,
                                         "small": "Ta",
                                         "molar": 180.94788,
                                         "electrons": [
                                                       2,
                                                       8,
                                                       18,
                                                       32,
                                                       11,
                                                       2
                                                       ]
                                       },
                                       {
                                         "group": "metalestransicion",
                                         "position": 5,
                                         "name": "Tungsten",
                                         "number": 74,
                                         "small": "W",
                                         "molar": 183.84,
                                         "electrons": [
                                                       2,
                                                       8,
                                                       18,
                                                       32,
                                                       12,
                                                       2
                                                       ]
                                       },
                                       {
                                         "group": "metalestransicion",
                                         "position": 6,
                                         "name": "Rhenium",
                                         "number": 75,
                                         "small": "Re",
                                         "molar": 186.207,
                                         "electrons": [
                                                       2,
                                                       8,
                                                       18,
                                                       32,
                                                       13,
                                                       2
                                                       ]
                                       },
                                       {
                                         "group": "metalestransicion",
                                         "position": 7,
                                         "name": "Osmium",
                                         "number": 76,
                                         "small": "Os",
                                         "molar": 190.23,
                                         "electrons": [
                                                       2,
                                                       8,
                                                       18,
                                                       32,
                                                       14,
                                                       2
                                                       ]
                                       },
                                       {
                                         "group": "metalestransicion",
                                         "position": 8,
                                         "name": "Iridium",
                                         "number": 77,
                                         "small": "Ir",
                                         "molar": 192.217,
                                         "electrons": [
                                                       2,
                                                       8,
                                                       18,
                                                       32,
                                                       15,
                                                       2
                                                       ]
                                       },
                                       {
                                         "group": "metalestransicion",
                                         "position": 9,
                                         "name": "Platinum",
                                         "number": 78,
                                         "small": "Pt",
                                         "molar": 195.084,
                                         "electrons": [
                                                       2,
                                                       8,
                                                       18,
                                                       32,
                                                       17,
                                                       1
                                                       ]
                                       },
                                       {
                                         "group": "metalestransicion",
                                         "position": 10,
                                         "name": "Gold",
                                         "number": 79,
                                         "small": "Au",
                                         "molar": 196.96657,
                                         "electrons": [
                                                       2,
                                                       8,
                                                       18,
                                                       32,
                                                       18,
                                                       1
                                                       ]
                                       },
                                       {
                                         "group": "metalestransicion",
                                         "position": 11,
                                         "name": "Mercury",
                                         "number": 80,
                                         "small": "Hg",
                                         "molar": 200.59,
                                         "electrons": [
                                                       2,
                                                       8,
                                                       18,
                                                       32,
                                                       18,
                                                       2
                                                       ]
                                       },
                                       {
                                         "group": "metalesbloquep",
                                         "position": 12,
                                         "name": "Thallium",
                                         "number": 81,
                                         "small": "Tl",
                                         "molar": 204.3833,
                                         "electrons": [
                                                       2,
                                                       8,
                                                       18,
                                                       32,
                                                       18,
                                                       3
                                                       ]
                                       },
                                       {
                                         "group": "nometales",
                                         "position": 13,
                                         "name": "Lead",
                                         "number": 82,
                                         "small": "Pb",
                                         "molar": 207.2,
                                         "electrons": [
                                                       2,
                                                       8,
                                                       18,
                                                       32,
                                                       18,
                                                       4
                                                       ]
                                       },
                                       {
                                         "group": "metalesbloquep",
                                         "position": 14,
                                         "name": "Bismuth",
                                         "number": 83,
                                         "small": "Bi",
                                         "molar": 208.9804,
                                         "electrons": [
                                                       2,
                                                       8,
                                                       18,
                                                       32,
                                                       18,
                                                       5
                                                       ]
                                       },
                                       {
                                         "group": "metalesbloquep",
                                         "position": 15,
                                         "name": "Polonium",
                                         "number": 84,
                                         "small": "Po",
                                         "molar": 209,
                                         "electrons": [
                                                       2,
                                                       8,
                                                       18,
                                                       32,
                                                       18,
                                                       6
                                                       ]
                                       },
                                       {
                                         "group": "nometales",
                                         "position": 16,
                                         "name": "Astatine",
                                         "number": 85,
                                         "small": "At",
                                         "molar": 210,
                                         "electrons": [
                                                       2,
                                                       8,
                                                       18,
                                                       32,
                                                       18,
                                                       7
                                                       ]
                                       },
                                       {
                                         "group": "gasesnobles",
                                         "position": 17,
                                         "name": "Radon",
                                         "number": 86,
                                         "small": "Rn",
                                         "molar": 222,
                                         "electrons": [
                                                       2,
                                                       8,
                                                       18,
                                                       32,
                                                       18,
                                                       8
                                                       ]
                                       }
                                       ]
                        },
                        {
                          "wiki": "http://en.wikipedia.org/wiki/Period%207%20element",
                          "elements": [
                                       {
                                         "group": "alkali",
                                         "position": 0,
                                         "name": "Francium",
                                         "number": 87,
                                         "small": "Fr",
                                         "molar": 223,
                                         "electrons": [
                                                       2,
                                                       8,
                                                       18,
                                                       32,
                                                       18,
                                                       8,
                                                       1
                                                       ]
                                       },
                                       {
                                         "group": "alcalinoterreos",
                                         "position": 1,
                                         "name": "Radium",
                                         "number": 88,
                                         "small": "Ra",
                                         "molar": 226,
                                         "electrons": [
                                                       2,
                                                       8,
                                                       18,
                                                       32,
                                                       18,
                                                       8,
                                                       2
                                                       ]
                                       },
                                       {
                                         "group": "Actinoid InnerBorder BlueLeft BlueRight",
                                         "position": 2,
                                         "name": "",
                                         "number": "",
                                         "small": "89-103"
                                       },
                                       {
                                         "group": "metalestransicion",
                                         "position": 3,
                                         "name": "Rutherfordium",
                                         "number": 104,
                                         "small": "Rf",
                                         "molar": 267,
                                         "electrons": [
                                                       2,
                                                       8,
                                                       18,
                                                       32,
                                                       32,
                                                       10,
                                                       2
                                                       ]
                                       },
                                       {
                                         "group": "metalestransicion",
                                         "position": 4,
                                         "name": "Dubnium",
                                         "number": 105,
                                         "small": "Db",
                                         "molar": 268,
                                         "electrons": [
                                                       2,
                                                       8,
                                                       18,
                                                       32,
                                                       32,
                                                       11,
                                                       2
                                                       ]
                                       },
                                       {
                                         "group": "metalestransicion",
                                         "position": 5,
                                         "name": "Seaborgium",
                                         "number": 106,
                                         "small": "Sg",
                                         "molar": 271,
                                         "electrons": [
                                                       2,
                                                       8,
                                                       18,
                                                       32,
                                                       32,
                                                       12,
                                                       2
                                                       ]
                                       },
                                       {
                                         "group": "metalestransicion",
                                         "position": 6,
                                         "name": "Bohrium",
                                         "number": 107,
                                         "small": "Bh",
                                         "molar": 272,
                                         "electrons": [
                                                       2,
                                                       8,
                                                       18,
                                                       32,
                                                       32,
                                                       13,
                                                       2
                                                       ]
                                       },
                                       {
                                         "group": "metalestransicion",
                                         "position": 7,
                                         "name": "Hassium",
                                         "number": 108,
                                         "small": "Hs",
                                         "molar": 270,
                                         "electrons": [
                                                       2,
                                                       8,
                                                       18,
                                                       32,
                                                       32,
                                                       14,
                                                       2
                                                       ]
                                       },
                                       {
                                         "group": "metalestransicion",
                                         "position": 8,
                                         "name": "Meitnerium",
                                         "number": 109,
                                         "small": "Mt",
                                         "molar": 276,
                                         "electrons": [
                                                       2,
                                                       8,
                                                       18,
                                                       32,
                                                       32,
                                                       15,
                                                       2
                                                       ]
                                       },
                                       {
                                         "group": "metalestransicion",
                                         "position": 9,
                                         "name": "Darmstadtium",
                                         "number": 110,
                                         "small": "Ds",
                                         "molar": 281,
                                         "electrons": [
                                                       2,
                                                       8,
                                                       18,
                                                       32,
                                                       32,
                                                       17,
                                                       1
                                                       ]
                                       },
                                       {
                                         "group": "metalestransicion",
                                         "position": 10,
                                         "name": "Roentgenium",
                                         "number": 111,
                                         "small": "Rg",
                                         "molar": 280,
                                         "electrons": [
                                                       2,
                                                       8,
                                                       18,
                                                       32,
                                                       32,
                                                       18,
                                                       1
                                                       ]
                                       },
                                       {
                                         "group": "metalestransicion",
                                         "position": 11,
                                         "name": "Copernicium",
                                         "number": 112,
                                         "small": "Cn",
                                         "molar": 285,
                                         "electrons": [
                                                       2,
                                                       8,
                                                       18,
                                                       32,
                                                       32,
                                                       18,
                                                       2
                                                       ]
                                       },
                                       {
                                         "group": "metalesbloquep",
                                         "position": 12,
                                         "name": "Ununtrium",
                                         "number": 113,
                                         "small": "Uut",
                                         "molar": 284,
                                         "electrons": [
                                                       2,
                                                       8,
                                                       18,
                                                       32,
                                                       32,
                                                       18,
                                                       3
                                                       ]
                                       },
                                       {
                                         "group": "metalesbloquep",
                                         "position": 13,
                                         "name": "Flerovium",
                                         "number": 114,
                                         "small": "Fl",
                                         "molar": 289,
                                         "electrons": [
                                                       2,
                                                       8,
                                                       18,
                                                       32,
                                                       32,
                                                       18,
                                                       4
                                                       ]
                                       },
                                       {
                                         "group": "metalesbloquep",
                                         "position": 14,
                                         "name": "Ununpentium",
                                         "number": 115,
                                         "small": "Uup",
                                         "molar": 288,
                                         "electrons": [
                                                       2,
                                                       8,
                                                       18,
                                                       32,
                                                       32,
                                                       18,
                                                       5
                                                       ]
                                       },
                                       {
                                         "group": "metalesbloquep",
                                         "position": 15,
                                         "name": "Livermorium",
                                         "number": 116,
                                         "small": "Lv",
                                         "molar": 293,
                                         "electrons": [
                                                       2,
                                                       8,
                                                       18,
                                                       32,
                                                       32,
                                                       18,
                                                       6
                                                       ]
                                       },
                                       {
                                         "group": "nometales",
                                         "position": 16,
                                         "name": "Ununseptium",
                                         "number": 117,
                                         "small": "Uus",
                                         "molar": 294,
                                         "electrons": [
                                                       2,
                                                       8,
                                                       18,
                                                       32,
                                                       32,
                                                       18,
                                                       7
                                                       ]
                                       },
                                       {
                                         "group": "gasesnobles",
                                         "position": 17,
                                         "name": "Ununoctium",
                                         "number": 118,
                                         "small": "Uuo",
                                         "molar": 294,
                                         "electrons": [
                                                       2,
                                                       8,
                                                       18,
                                                       32,
                                                       32,
                                                       18,
                                                       8
                                                       ]
                                       }
                                       ]
                        }
                        ],
                        "lanthanoids": [
                                        {
                                          "group": "metalestransicion",
                                          "position": 2,
                                          "name": "Lanthanum",
                                          "number": 57,
                                          "small": "La",
                                          "molar": 138.90547,
                                          "electrons": [
                                                        2,
                                                        8,
                                                        18,
                                                        18,
                                                        9,
                                                        2
                                                        ]
                                        },
                                        {
                                          "group": "lantanidos",
                                          "position": 3,
                                          "name": "Cerium",
                                          "number": 58,
                                          "small": "Ce",
                                          "molar": 140.116,
                                          "electrons": [
                                                        2,
                                                        8,
                                                        18,
                                                        19,
                                                        9,
                                                        2
                                                        ]
                                        },
                                        {
                                          "group": "lantanidos",
                                          "position": 4,
                                          "name": "Praseodymium",
                                          "number": 59,
                                          "small": "Pr",
                                          "molar": 140.90765,
                                          "electrons": [
                                                        2,
                                                        8,
                                                        18,
                                                        21,
                                                        8,
                                                        2
                                                        ]
                                        },
                                        {
                                          "group": "lantanidos",
                                          "position": 5,
                                          "name": "Neodymium",
                                          "number": 60,
                                          "small": "Nd",
                                          "molar": 144.242,
                                          "electrons": [
                                                        2,
                                                        8,
                                                        18,
                                                        22,
                                                        8,
                                                        2
                                                        ]
                                        },
                                        {
                                          "group": "lantanidos",
                                          "position": 6,
                                          "name": "Promethium",
                                          "number": 61,
                                          "small": "Pm",
                                          "molar": 145,
                                          "electrons": [
                                                        2,
                                                        8,
                                                        18,
                                                        23,
                                                        8,
                                                        2
                                                        ]
                                        },
                                        {
                                          "group": "lantanidos",
                                          "position": 7,
                                          "name": "Samarium",
                                          "number": 62,
                                          "small": "Sm",
                                          "molar": 150.36,
                                          "electrons": [
                                                        2,
                                                        8,
                                                        18,
                                                        24,
                                                        8,
                                                        2
                                                        ]
                                        },
                                        {
                                          "group": "lantanidos",
                                          "position": 8,
                                          "name": "Europium",
                                          "number": 63,
                                          "small": "Eu",
                                          "molar": 151.964,
                                          "electrons": [
                                                        2,
                                                        8,
                                                        18,
                                                        25,
                                                        8,
                                                        2
                                                        ]
                                        },
                                        {
                                          "group": "lantanidos",
                                          "position": 9,
                                          "name": "Gadolinium",
                                          "number": 64,
                                          "small": "Gd",
                                          "molar": 157.25,
                                          "electrons": [
                                                        2,
                                                        8,
                                                        18,
                                                        25,
                                                        9,
                                                        2
                                                        ]
                                        },
                                        {
                                          "group": "lantanidos",
                                          "position": 10,
                                          "name": "Terbium",
                                          "number": 65,
                                          "small": "Tb",
                                          "molar": 158.92535,
                                          "electrons": [
                                                        2,
                                                        8,
                                                        18,
                                                        27,
                                                        8,
                                                        2
                                                        ]
                                        },
                                        {
                                          "group": "lantanidos",
                                          "position": 11,
                                          "name": "Dysprosium",
                                          "number": 66,
                                          "small": "Dy",
                                          "molar": 162.5,
                                          "electrons": [
                                                        2,
                                                        8,
                                                        18,
                                                        28,
                                                        8,
                                                        2
                                                        ]
                                        },
                                        {
                                          "group": "lantanidos",
                                          "position": 12,
                                          "name": "Holmium",
                                          "number": 67,
                                          "small": "Ho",
                                          "molar": 164.93031,
                                          "electrons": [
                                                        2,
                                                        8,
                                                        18,
                                                        29,
                                                        8,
                                                        2
                                                        ]
                                        },
                                        {
                                          "group": "lantanidos",
                                          "position": 13,
                                          "name": "Erbium",
                                          "number": 68,
                                          "small": "Er",
                                          "molar": 167.259,
                                          "electrons": [
                                                        2,
                                                        8,
                                                        18,
                                                        30,
                                                        8,
                                                        2
                                                        ]
                                        },
                                        {
                                          "group": "lantanidos",
                                          "position": 14,
                                          "name": "Thulium",
                                          "number": 69,
                                          "small": "Tm",
                                          "molar": 168.9342,
                                          "electrons": [
                                                        2,
                                                        8,
                                                        18,
                                                        31,
                                                        8,
                                                        2
                                                        ]
                                        },
                                        {
                                          "group": "lantanidos",
                                          "position": 15,
                                          "name": "Ytterbium",
                                          "number": 70,
                                          "small": "Yb",
                                          "molar": 173.054,
                                          "electrons": [
                                                        2,
                                                        8,
                                                        18,
                                                        32,
                                                        8,
                                                        2
                                                        ]
                                        },
                                        {
                                          "group": "lantanidos",
                                          "position": 16,
                                          "name": "Lutetium",
                                          "number": 71,
                                          "small": "Lu",
                                          "molar": 174.9668,
                                          "electrons": [
                                                        2,
                                                        8,
                                                        18,
                                                        32,
                                                        9,
                                                        2
                                                        ]
                                        }
                                        ],
                                        "actinoids": [
                                                      {
                                                        "group": "metalestransicion",
                                                        "position": 2,
                                                        "name": "Actinium",
                                                        "number": 89,
                                                        "small": "Ac",
                                                        "molar": 227,
                                                        "electrons": [
                                                                      2,
                                                                      8,
                                                                      18,
                                                                      32,
                                                                      18,
                                                                      9,
                                                                      2
                                                                      ]
                                                      },
                                                      {
                                                        "group": "actinidos",
                                                        "position": 3,
                                                        "name": "Thorium",
                                                        "number": 90,
                                                        "small": "Th",
                                                        "molar": 232.03806,
                                                        "electrons": [
                                                                      2,
                                                                      8,
                                                                      18,
                                                                      32,
                                                                      18,
                                                                      10,
                                                                      2
                                                                      ]
                                                      },
                                                      {
                                                        "group": "actinidos",
                                                        "position": 4,
                                                        "name": "Protactinium",
                                                        "number": 91,
                                                        "small": "Pa",
                                                        "molar": 231.03587,
                                                        "electrons": [
                                                                      2,
                                                                      8,
                                                                      18,
                                                                      32,
                                                                      20,
                                                                      9,
                                                                      2
                                                                      ]
                                                      },
                                                      {
                                                        "group": "actinidos",
                                                        "position": 5,
                                                        "name": "Uranium",
                                                        "number": 92,
                                                        "small": "U",
                                                        "molar": 238.02892,
                                                        "electrons": [
                                                                      2,
                                                                      8,
                                                                      18,
                                                                      32,
                                                                      21,
                                                                      9,
                                                                      2
                                                                      ]
                                                      },
                                                      {
                                                        "group": "actinidos",
                                                        "position": 6,
                                                        "name": "Neptunium",
                                                        "number": 93,
                                                        "small": "Np",
                                                        "molar": 237,
                                                        "electrons": [
                                                                      2,
                                                                      8,
                                                                      18,
                                                                      32,
                                                                      22,
                                                                      9,
                                                                      2
                                                                      ]
                                                      },
                                                      {
                                                        "group": "actinidos",
                                                        "position": 7,
                                                        "name": "Plutonium",
                                                        "number": 94,
                                                        "small": "Pu",
                                                        "molar": 244,
                                                        "electrons": [
                                                                      2,
                                                                      8,
                                                                      18,
                                                                      32,
                                                                      24,
                                                                      8,
                                                                      2
                                                                      ]
                                                      },
                                                      {
                                                        "group": "actinidos",
                                                        "position": 8,
                                                        "name": "Americium",
                                                        "number": 95,
                                                        "small": "Am",
                                                        "molar": 243,
                                                        "electrons": [
                                                                      2,
                                                                      8,
                                                                      18,
                                                                      32,
                                                                      25,
                                                                      8,
                                                                      2
                                                                      ]
                                                      },
                                                      {
                                                        "group": "actinidos",
                                                        "position": 9,
                                                        "name": "Curium",
                                                        "number": 96,
                                                        "small": "Cm",
                                                        "molar": 247,
                                                        "electrons": [
                                                                      2,
                                                                      8,
                                                                      18,
                                                                      32,
                                                                      25,
                                                                      9,
                                                                      2
                                                                      ]
                                                      },
                                                      {
                                                        "group": "actinidos",
                                                        "position": 10,
                                                        "name": "Berkelium",
                                                        "number": 97,
                                                        "small": "Bk",
                                                        "molar": 247,
                                                        "electrons": [
                                                                      2,
                                                                      8,
                                                                      18,
                                                                      32,
                                                                      27,
                                                                      8,
                                                                      2
                                                                      ]
                                                      },
                                                      {
                                                        "group": "actinidos",
                                                        "position": 11,
                                                        "name": "Californium",
                                                        "number": 98,
                                                        "small": "Cf",
                                                        "molar": 251,
                                                        "electrons": [
                                                                      2,
                                                                      8,
                                                                      18,
                                                                      32,
                                                                      28,
                                                                      8,
                                                                      2
                                                                      ]
                                                      },
                                                      {
                                                        "group": "actinidos",
                                                        "position": 12,
                                                        "name": "Einsteinium",
                                                        "number": 99,
                                                        "small": "Es",
                                                        "molar": 252,
                                                        "electrons": [
                                                                      2,
                                                                      8,
                                                                      18,
                                                                      32,
                                                                      29,
                                                                      8,
                                                                      2
                                                                      ]
                                                      },
                                                      {
                                                        "group": "actinidos",
                                                        "position": 13,
                                                        "name": "Fermium",
                                                        "number": 100,
                                                        "small": "Fm",
                                                        "molar": 257,
                                                        "electrons": [
                                                                      2,
                                                                      8,
                                                                      18,
                                                                      32,
                                                                      30,
                                                                      8,
                                                                      2
                                                                      ]
                                                      },
                                                      {
                                                        "group": "actinidos",
                                                        "position": 14,
                                                        "name": "Mendelevium",
                                                        "number": 101,
                                                        "small": "Md",
                                                        "molar": 258,
                                                        "electrons": [
                                                                      2,
                                                                      8,
                                                                      18,
                                                                      32,
                                                                      31,
                                                                      8,
                                                                      2
                                                                      ]
                                                      },
                                                      {
                                                        "group": "actinidos",
                                                        "position": 15,
                                                        "name": "Nobelium",
                                                        "number": 102,
                                                        "small": "No",
                                                        "molar": 259,
                                                        "electrons": [
                                                                      2,
                                                                      8,
                                                                      18,
                                                                      32,
                                                                      32,
                                                                      8,
                                                                      2
                                                                      ]
                                                      },
                                                      {
                                                        "group": "actinidos",
                                                        "position": 16,
                                                        "name": "Lawrencium",
                                                        "number": 103,
                                                        "small": "Lr",
                                                        "molar": 262,
                                                        "electrons": [
                                                                      2,
                                                                      8,
                                                                      18,
                                                                      32,
                                                                      32,
                                                                      8,
                                                                      3
                                                                      ]
                                                      }
                                                      ]
  };
  
}

