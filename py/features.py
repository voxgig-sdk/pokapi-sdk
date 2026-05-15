# Pokapi SDK feature factory

from feature.base_feature import PokapiBaseFeature
from feature.test_feature import PokapiTestFeature


def _make_feature(name):
    features = {
        "base": lambda: PokapiBaseFeature(),
        "test": lambda: PokapiTestFeature(),
    }
    factory = features.get(name)
    if factory is not None:
        return factory()
    return features["base"]()
