import { Component } from '@angular/core';
import { NavController, AlertController } from 'ionic-angular';
import { RestProvider } from '../../providers/rest/rest';

@Component({
  selector: 'obras',
  templateUrl: 'obras.html',
})
export class Obras {
  
  obras: any = [];
 
  constructor(public navCtrl: NavController, public restProvider: RestProvider, private alert: AlertController) {
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
                   setInterval(()=> {
                     this.getArt(); },100); 
                }
            }
        ]
    });
    alert.present();
  }
 


}


