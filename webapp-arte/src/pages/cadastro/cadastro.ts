import { Component } from '@angular/core';
import { NavController, ToastController  } from 'ionic-angular';
import { RestProvider } from '../../providers/rest/rest';

@Component({
  selector: 'cadastro',
  templateUrl: 'cadastro.html'
})
export class Cadastro {
  
 obra = { titulo: '', autor: '', genero: '', dia: '', celular: '', descricao: '', imagem: ''};

  constructor(public navCtrl: NavController, public restProvider: RestProvider, public toastController: ToastController) {

  }
  
saveArt() { 
 this.restProvider.saveArt(this.obra).then(async (result) => { 
   const toast = await this.toastController.create({
      message: 'Cadastro efetuado com sucesso!',
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
 
 //resetar o formulário ao enviar
    this.obra.titulo =null;
    this.obra.autor =null;
    this.obra.genero =null;
    this.obra.dia =null;
    this.obra.celular =null;
    this.obra.descricao =null;
    this.obra.imagem =null;
}

}
