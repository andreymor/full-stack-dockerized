import {CoreComponent} from "./core.component";
import {ActivatedRoute} from "@angular/router";

export abstract class CoreItemComponent extends CoreComponent {

    constructor(protected activatedRoute: ActivatedRoute) {
        super(activatedRoute);
    }

}
