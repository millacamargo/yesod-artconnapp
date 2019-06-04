import { Component } from '@angular/core';
import { NavController, NavParams, ToastController } from 'ionic-angular';
import { RestProvider } from '../../providers/rest/rest';

@Component({
  selector: 'obra',
  templateUrl: 'Obra.html',
})
export class Obra {
    obra: any;
    
    obra = { titulo: '', autor: '', genero: '', dia: '', celular: '', descricao: ''};

  constructor(public navCtrl: NavController, public navParams: NavParams, public restProvider: RestProvider,public toastController: ToastController) {
   this.obra = this.navParams.get('obra');
  }
  
   updateArt(obra) { 
     this.restProvider.updateArt(this.obra).then( async (result) => { 
       const toast = await this.toastController.create({
          message: 'Edição feita com sucesso!',
          duration: 2000
        });
        toast.present();
      }, async (err) => { 
     const toast = await this.toastController.create({
          message: 'Algo deu errado',
          duration: 2000
        });
        toast.present();
     }); 
}
    
  }