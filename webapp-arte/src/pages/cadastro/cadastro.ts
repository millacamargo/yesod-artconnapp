import { Component } from '@angular/core';
import { NavController, ToastController  } from 'ionic-angular';
import { RestProvider } from '../../providers/rest/rest';

@Component({
  selector: 'cadastro',
  templateUrl: 'cadastro.html'
})
export class Cadastro {
  
  obra = { titulo: '', autor: '', genero: '', dia: '', celular: ''};

  constructor(public navCtrl: NavController, public restProvider: RestProvider, public toastController: ToastController) {

  }
  
saveArt() { 
  this.restProvider.saveArt(this.obra).then((result) => { 
  console.log(result); 
  }, (err) => { 
  console.log(err); 
  }); 
}

async presentToast() {
    const toast = await this.toastController.create({
      message: 'Cadastro efetuado com sucesso!',
      duration: 2000
    });
    toast.present();
  }

}
