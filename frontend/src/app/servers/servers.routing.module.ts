import { Component, ModuleWithProviders, NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { ServersComponent } from './servers.component';
import { ServersResolver } from './servers.resolver';

const ROUTES: Routes = [
    {
        path: '',
        component: ServersComponent,
        resolve: {
            data: ServersResolver
        }
    }
];

@NgModule({
    imports: [RouterModule.forChild(ROUTES)],
    exports: [RouterModule]
})
export class ServersRoutingModule {
}