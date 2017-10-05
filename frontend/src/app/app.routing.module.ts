import { Component, ModuleWithProviders, NgModule } from '@angular/core';
import { Routes, RouterModule, PreloadAllModules } from '@angular/router';

import {HomeComponent} from "./home/home.component";

const APP_ROUTES: Routes = [
    {
        path: '',
        redirectTo: '/home',
        pathMatch: 'full'
    },
    {
        path: 'home',
        component: HomeComponent
    },
    {
        path: 'servers',
        loadChildren: './servers/servers.module#ServersModule'
    }
];

@NgModule({
    imports: [RouterModule.forRoot(APP_ROUTES, { preloadingStrategy: PreloadAllModules })],
    exports: [RouterModule]
})
export class AppRoutingModule {
}