import {APP_INITIALIZER, NgModule} from '@angular/core';
import {BrowserModule} from '@angular/platform-browser';
import {FormsModule, ReactiveFormsModule} from '@angular/forms';
import {Http, HttpModule} from '@angular/http';

import {AppComponent} from "./app.component";
import {AppRoutingModule} from "./app.routing.module";
import {CoreModule} from "../core/core.module";
import {ServersResolver} from "./servers/servers.resolver";
import {ServersService} from "./servers/servers.service";
import {HomeComponent} from "./home/home.component";

@NgModule({
    declarations: [
        AppComponent,
        HomeComponent
    ],
    imports: [
        BrowserModule,
        FormsModule,
        ReactiveFormsModule,
        HttpModule,
        AppRoutingModule,
        CoreModule.forRoot()
    ],
    providers: [
        ServersResolver, ServersService
    ],
    bootstrap: [AppComponent]
})


export class AppModule {
}
