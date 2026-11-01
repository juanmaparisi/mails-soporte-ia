-- Registro de cada mail de soporte: lo que llegó, lo que propuso la IA y lo que decidió una persona.
CREATE TABLE IF NOT EXISTS soporte_mails (
  id               TEXT PRIMARY KEY,
  remitente        TEXT,
  asunto           TEXT,
  mensaje          TEXT,              -- ya con los datos sensibles ocultos
  recibido         TIMESTAMPTZ,
  categoria        TEXT,              -- consulta, reclamo, cambio_devolucion, facturacion, spam, otro
  urgencia         TEXT,              -- alta, media, baja
  resumen          TEXT,
  flags            TEXT,              -- legal, datos_sensibles, inyeccion, amenaza, enojo, promesa
  borrador         TEXT,              -- respuesta propuesta por la IA
  respuesta_final  TEXT,              -- respuesta aprobada (puede estar editada por una persona)
  prioridad        TEXT,
  estado           TEXT NOT NULL,     -- pendiente, aprobado, respondido, escalado, descartado
  motivo           TEXT,
  decision         TEXT,
  decidido_at      TIMESTAMPTZ,
  respondido_at    TIMESTAMPTZ,
  creado_at        TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_soporte_mails_estado ON soporte_mails (estado);
