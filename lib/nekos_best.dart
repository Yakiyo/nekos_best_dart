/// A minimal package to interact with nekos.best api
library nekos_best;

export 'src/nb.dart' show fetch, Client;
export 'src/structs.dart'
    show
        NBResponse,
        NBBufferResponse,
        NBError,
        NBRateLimitError,
        NBArgumentError;
