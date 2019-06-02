import { Component } from '@angular/core';
import { NavController } from 'ionic-angular';
import { RestProvider } from '../../providers/rest/rest';

@Component({
  selector: 'cadastro',
  templateUrl: 'cadastro.html'
})
export class Cadastro {
  
  obra = { titulo: '', autor: '', dia: '', celular: ''};

  constructor(public navCtrl: NavController, public restProvider: RestProvider) {

  }
  
saveArt() { 
  this.restProvider.saveArt(this.obra).then((result) => { 
  console.log(result); 
  }, (err) => { 
  console.log(err); 
  }); 
}

}
