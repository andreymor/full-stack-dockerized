import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import {ServersRoutingModule} from "./servers.routing.module";
import {CoreModule} from "../../core/core.module";
import {ReactiveFormsModule} from "@angular/forms";
import {ServersComponent} from "./servers.component";
import {ServerListComponent} from "./server-list/server-list.component";
import {ServersResolver} from "./servers.resolver";
import {ServersService} from "./servers.service";
import {NouisliderModule} from "ng2-nouislider/src/nouislider";

@NgModule({
  imports: [
    CommonModule,
    ServersRoutingModule,
    CoreModule,
    NouisliderModule,
    ReactiveFormsModule
  ],
  declarations: [ServersComponent, ServerListComponent],
  providers: [ServersResolver, ServersService]
})
export class ServersModule { }
