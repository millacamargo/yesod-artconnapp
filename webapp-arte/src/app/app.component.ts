import { Component, ViewChild } from '@angular/core';
import { Nav, Platform } from 'ionic-angular';
import { StatusBar } from '@ionic-native/status-bar';
import { SplashScreen } from '@ionic-native/splash-screen';

import { HomePage } from '../pages/home/home';
import { Cadastro } from '../pages/cadastro/cadastro';
import { Login } from '../pages/login/login';
import { CadastroObra } from '../pages/cadastroObra/cadastroObra';
import { HomeUser } from '../pages/homeUser/homeUser';

@Component({
  templateUrl: 'app.html'
})
export class MyApp {
  @ViewChild(Nav) nav: Nav;
  rootPage:any = HomePage;
  activePage: any;
  pages: Array<{title: string, component: any}>;
  constructor(public platform: Platform, statusBar: StatusBar, splashScreen: SplashScreen) {
   
  this.pages = [
      {title: 'Home', component: HomePage},
      {title: 'Cadastro', component: Cadastro},
      {title: 'Login', component: Login},
      {title: 'Cadastre seu Obra', component: CadastroObra},
      {title: 'Ver Obras', component: HomeUser}
    ];
    this.activePage = this.pages[0];
  
    this.platform.ready().then(() => {
      // Okay, so the platform is ready and our plugins are available.
      // Here you can do any higher level native things you might need.
      statusBar.styleDefault();
      splashScreen.hide();
    });
  }
  openPage(page){
    this.nav.setRoot(page.component);
    this.activePage = page;
  }
  checkActive(page){
    return page == this.activePage;
  }
}

