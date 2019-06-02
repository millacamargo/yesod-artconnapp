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
import { Obras } from '../pages/obras/obras';
import { Obra } from '../pages/obra/obra';
import { HttpClientModule } from '@angular/common/http';
 

@NgModule({
  declarations: [
    MyApp,
    HomePage,
    Cadastro,
    Login,
    CadastroObra,
    Obras,
    Obra
  ],
  imports: [
    BrowserModule,
    HttpClientModule,
    IonicModule.forRoot(MyApp)
  ],
  bootstrap: [IonicApp],
  entryComponents: [
    MyApp,
    HomePage,
    Cadastro,
    Login,
    CadastroObra,
    Obras,
    Obra
  ],
  providers: [
    StatusBar,
    SplashScreen,
    {provide: ErrorHandler, useClass: IonicErrorHandler}
  ]
})
export class AppModule {}

