# Pokapi SDK utility: make_context

from core.context import PokapiContext


def make_context_util(ctxmap, basectx):
    return PokapiContext(ctxmap, basectx)
