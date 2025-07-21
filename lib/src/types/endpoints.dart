/// Url Base de la DGII
const kBaseEcfUrl = 'https://ecf.dgii.gov.do';

/// Url Base de la DGII para facturas de consumo menores a 250k
const kBaseUrlFc = 'https://fc.dgii.gov.do';

/// EndPoint de la semilla de la DGII
const kSemillaEndPoint = '/autenticacion/api/autenticacion/semilla';

/// EndPoint para validar la semilla firmada de la DGII
const kValidarSemillaEndPoint =
    '/autenticacion/api/autenticacion/validarsemilla';

/// EndPoint para recepcion de un [EcfModel]
const kRecepcionEcfEndPoint = '/recepcion/api/facturaselectronicas';

/// EndPoint para recepcion de un [EcfModel] de consumo menor a 250k

const kRecepcionFcEcfEndPoint = '/recepcionfc/api/recepcion/ecf';

/// EndPoint para enviar [AprobacionComercial]
const kAprobacionEcfEndPoint = '/AprobacionComercial/api/AprobacionComercial';

/// EndPoint para consultar estado del [EcfModel]
const kTrackIdEcfEndPoint = '/consultaresultado/api/consultas/estado';

/// EndPoint para consultar timbre

const kConsultaTimbre = '/ConsultaTimbre';

/// EndPoint para consultar timbre de Factura de consumo menor a 250k

const kConsultaTimbreFc = '/ConsultaTimbreFC';
