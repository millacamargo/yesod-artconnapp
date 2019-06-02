import { Component } from '@angular/core';
import { NavController, NavParams } from 'ionic-angular';

@Component({
  selector: 'obra',
  templateUrl: 'obra.html',
})
export class Obra {
  obra: any;

  constructor(public navCtrl: NavController, public navParams: NavParams) {
  this.obra = this.navParams.get('obra');
    
  }
  
 

}

