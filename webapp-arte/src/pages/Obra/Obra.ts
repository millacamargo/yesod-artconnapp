import { Component } from '@angular/core';
import { NavController, NavParams, ToastController } from 'ionic-angular';
import { RestProvider } from '../../providers/rest/rest';

@Component({
  selector: 'obra',
  templateUrl: 'Obra.html',
})
export class Obra {
    
    obra = { titulo: '', autor: '', genero: '', dia: '', celular: '', descricao: '', imagem: ''};

  constructor(public navCtrl: NavController, public navParams: NavParams, public restProvider: RestProvider,public toastController: ToastController) {
   this.obra = this.navParams.get('obra');
  }
  
  
  
   updateArt(obra) { 
     this.restProvider.updateArt(this.obra).then( (result) => { 
      console.log(result);
      }, (err) => { 
     console.log(err);
     }); 
      const toast = this.toastController.create({
          message: 'Alteração feita com sucesso!',
          duration: 2000
        });
        toast.present();
}
   
  }