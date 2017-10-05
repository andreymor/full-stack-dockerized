import {Component, OnInit, Input} from '@angular/core';
import {ActivatedRoute, Router} from "@angular/router";
import {FormControl, FormArray, FormGroup} from "@angular/forms";

import {ServersComponent} from "../servers.component";
import {ServersService} from "../servers.service";
import {isNumber} from "util";
import {Subscription} from "rxjs";
import {CoreListItemComponent} from "../../../core/component/core.list-item.component";

@Component({
    selector: 'app-server-list',
    templateUrl: './server-list.component.html',
    styleUrls: ['./server-list.component.css']
})
export class ServerListComponent extends CoreListItemComponent implements OnInit {
    /**
     *
     */
    originalData: Array<any>;

    /**
     *
     */
    formSubscription: Subscription;

    hddRangeConfig: any = {
        start: [0],
        behaviour: 'snap',
        connect: [true, false],
        range: {
            'min': [0],
            '9%': [240, 260],
            '18%': [500, 500],
            '27%': [1000, 1000],
            '36%': [2000, 1000],
            '45%': [3000, 1000],
            '54%': [4000, 1000],
            '63%': [5000, 1000],
            '72%': [6000, 18000],
            '81%': [24000, 24000],
            '90%': [48000, 24000],
            'max': [72000]
        },
        tooltips: [ false],
        pips: {
            mode: 'steps',
            filter: (v, t) => v % 72000 ? 0 : 1,
            density: 10,
            values: [0, 100],
            format: {
                to: (v, t) => (v > 1000) ? v/1000 + 'TB' : v + 'GB',
                from: (v, t) => v.replace('GB', '')
            }
        }
    }

    /**
     *
     * @param serversService
     * @param activatedRoute
     * @param router
     */
    constructor(protected serversService: ServersService, protected activatedRoute: ActivatedRoute, protected router: Router) {
        super(activatedRoute, serversService, router);
    }


    /**
     *
     * @returns {string}
     */
    showStorageValue(): string {
        let storageValue = this.form.get('formInput').get('hddId').value || 0;
        return (storageValue >= 1000) ? storageValue /1000 + 'TB' : storageValue + 'GB'
    }

    /**
     *
     */
    ngOnInit() {
        super.ngOnInit();

        this.form.get('formInput').addControl('hddTypeId', new FormControl());
        this.form.get('formInput').addControl('locationId', new FormControl());
        this.form.get('formInput').addControl('hddId', new FormControl(0));
        this.form.get('formInput').addControl('ramId', new FormArray([]));

        this.formData.rams.map(ram => {
            this.form.get('formInput').get('ramId').push(
                new FormGroup({
                    id: new FormControl(ram.id),
                    name: new FormControl(ram.name),
                    checked: new FormControl(false),
                })
            )
        });

        this.formSubscription = this.form.valueChanges.subscribe(data => {
            this.filter(data.formInput);
        })

    }

    /**
     *
     */
    ngOnDestroy() {
        this.formSubscription.unsubscribe();
    }

    /**
     *
     */
    clear(): void {
        this.form.get('formInput').reset();
    }

    /**
     *
     * @param response
     */
    resolveData(response: any): void {
        super.resolveData(response);
        this.originalData = this.listData; //making a copy of original listData
    }

    /**
     *
     * @param content
     */
    filter(content: any): void {
        this.listData = this.originalData
            .filter(storage => {
                if (isNumber(content.hddId) && content.hddId > 0) {
                    return storage.totalHddSize == content.hddId;
                }

                return storage;
            })
            .filter(ram => {
                let counter = content.ramId.filter(rid => {
                    return rid.checked;
                }).length;

                if (counter) {
                    return content.ramId.some(rid => {
                        return rid.checked && rid.id == ram.ramId;
                    });
                }

                return ram;

            })
            .filter(location => {
                if (isNumber(content.locationId)) {
                    return location.locationId == content.locationId;
                }
                return location;
            })
            .filter(hddType => {
                if (isNumber(content.hddTypeId)) {
                    return hddType.hddTypeId == content.hddTypeId;
                }
                return hddType;
            });
    }
}