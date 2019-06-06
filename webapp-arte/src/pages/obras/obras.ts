import { Component } from '@angular/core';
import { NavController, AlertController, NavParams  } from 'ionic-angular';
import { RestProvider } from '../../providers/rest/rest';
import {Obra} from '../Obra/Obra';

@Component({
  selector: 'obras',
  templateUrl: 'obras.html',
})
export class Obras {
    
  obras: any = [];
 
  constructor(public navCtrl: NavController, public restProvider: RestProvider, private alert: AlertController,public navParams: NavParams) {
   this.getArt();
  }
  
  getArt() {
  this.restProvider.getArt()
   .then(data => {
     this.obras = data.obras;
     console.log(this.obras);
});
 }

deleteArt(obra){
  let alert = this.alert.create({
        title: 'Confirmação',
        message: 'Tem certeza que deseja deletar esta obra?',
        buttons: [
            {
                text: 'Não',
                handler: () => {
                    console.log('Clique cancelado');
                }
            },
            {
                text: 'Sim',
                handler: () => {
                   this.restProvider.deleteArt(obra);
                   setTimeout(() => {
                    this.getArt();}, 500); 
                }
                
            }
        ]
    });
    alert.present();
  }
 
editArt(obra) {
    this.navCtrl.push(Obra, {obra: obra});
  }

}


