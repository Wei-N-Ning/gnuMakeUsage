//
// Created by wein on 5/2/18.
//

struct Model;

struct View {
    struct Model *model;
};

void refresh(struct View *view) {
    if (view->model) {
        ;
    }
}
