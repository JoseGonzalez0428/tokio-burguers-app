# Tokio Burguer's — App de pedidos

App móvil (Flutter) para consultar el menú y armar un pedido en **Tokio Burguer's**. Proyecto final de *Fundamentos de Desarrollo Móvil* (UASLP).

**Alcance de este primer avance:** estructura del proyecto + menú estático (sin base de datos) + carrito en memoria. Lo demás (persistencia, sesión, checkout con GPS, panel admin) está planeado para las siguientes etapas.

- **Tecnología:** Flutter (híbrido) · Material Design 3 · Provider
- **Arquitectura:** feature-first (ver [`docs/ARQUITECTURA.md`](docs/ARQUITECTURA.md))
- **Hardware planeado:** GPS (validar zona de entrega y autocompletar dirección) — se integra en el checkout, etapa siguiente

## Uso de inteligencia artificial

Este proyecto se desarrolla con apoyo de un asistente de IA (Claude, de Anthropic), declarado conforme a los lineamientos del curso, que permiten su uso siempre que se justifique y el autor sepa explicar qué hace cada parte y por qué se decidió así.

- **Dónde se usó la IA:** creación de la arquitectura feature-first de acuerdo a la propuesta del proyecto, esqueleto inicial del código (`lib/`), captura de los datos del menú a partir de la foto del menú impreso y redacción de documentación.
- **Qué hice yo:** Definición del alcance del proyecto, comunicación con el dueño del restaurante, verificación de la aprobación del diseño planteado, visité el restaurante y capturé la información referente a su menú con fecha del 14/10, definí el diseño visual mediante un chat con claude design y me inspiré en las mejores prácticas de acuerdo a mis apps de uso cotidiano como rappi o didi. 
