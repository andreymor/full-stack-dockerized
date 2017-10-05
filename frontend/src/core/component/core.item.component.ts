import {CoreComponent} from "./core.component";
import {ActivatedRoute} from "@angular/router";

/**
 * Classe de base para detalhamento de um item que é resolvido da rota
 */
export abstract class CoreItemComponent extends CoreComponent {

    constructor(protected activatedRoute: ActivatedRoute) {
        super(activatedRoute);
    }

}
