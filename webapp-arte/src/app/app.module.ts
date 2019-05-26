import { BrowserModule } from '@angular/platform-browser';
import { ErrorHandler, NgModule } from '@angular/core';
import { IonicApp, IonicErrorHandler, IonicModule } from 'ionic-angular';
import { SplashScreen } from '@ionic-native/splash-screen';
import { StatusBar } from '@ionic-native/status-bar';

import { MyApp } from './app.component';
import { HomePage } from '../pages/home/home';
import { Cadastro } from '../pages/cadastro/cadastro';
import { Login } from '../pages/login/login';
import { CadastroObra } from '../pages/cadastroObra/cadastroObra';
import { HomeUser } from '../pages/homeUser/homeUser';

@NgModule({
  declarations: [
    MyApp,
    HomePage,
    Cadastro,
    Login,
    CadastroObra,
    HomeUser
  ],
  imports: [
    BrowserModule,
    IonicModule.forRoot(MyApp)
  ],
  bootstrap: [IonicApp],
  entryComponents: [
    MyApp,
    HomePage,
    Cadastro,
    Login,
    CadastroObra,
    HomeUser
  ],
  providers: [
    StatusBar,
    SplashScreen,
    {provide: ErrorHandler, useClass: IonicErrorHandler}
  ]
})
export class AppModule {}

