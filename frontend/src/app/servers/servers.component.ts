import {Component, OnInit} from '@angular/core';
import {CoreListItemComponent} from "../../core/component/core.list-item.component";
import {ActivatedRoute, Router} from "@angular/router";
import {ServersService} from "./servers.service";

@Component({
    selector: 'app-servers',
    templateUrl: './servers.component.html',
    styleUrls: ['./servers.component.css']
})
export class ServersComponent extends CoreListItemComponent implements OnInit {

    constructor(protected serversService: ServersService, protected activatedRoute: ActivatedRoute, protected router: Router) {
        super(activatedRoute, serversService, router);
    }
}
