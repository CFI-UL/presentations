# Ian's workshops - ATDD-TDD

### Fonctionnement de l'atelier

1. Commencer par la feature [produce_invoices.feature](src/test/resources/ianlet/workshop/atddtdd/produce_invoices.feature)
2. Ecrire le minimum de code possible dans une `Glue` pour decrire le premier scenario a un niveau _moyen_ (application service)
4. Commit!
5. Dig in! En TDD!
6. Tester le service applicatif
7. Commit!
8. Tester le domaine
9. Commit, commit, commit!
10. Magie! Les tests unitaires sont verts et le scenario aussi! (si vous avez bien fait ca)
11. PR, squash commits, merge PR
12. Next scenario!
13. Feature terminee? Next feature [taxes.feature](src/test/resources/ianlet/workshop/atddtdd/taxes.feature)!

### Et apres?

- Les glues deviennent trop grosses ? Les separer!
- Partage d'objets entre differentes glues devient difficile? Deleguer a des `SupportClass`
- Tester a un niveau plus haut (UI) sans reecrire toutes les glues? Abstraire les `SupportClass` et fournir des implementations differentes selon le contexte d'execution (haut + bd, haut + mock, moyen, ...)
